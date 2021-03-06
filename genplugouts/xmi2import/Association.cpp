
#include "Association.h"
#include "FileIn.h"
#include "Token.h"

#include "UmlCom.h"
#include "UmlRelation.h"
#include "UmlClass.h"
//Added by qt3to4:
#include "misc/mystr.h"
void Role::setMultiplicity(WrapperStr v, bool upper, const char * dflt)
{
    if (v.isEmpty())
        v = dflt;

    if (!v.isEmpty() &&
        (v != "Unspecified")) {	// VP
        if (multiplicity.isEmpty())
            multiplicity = v;
        else if (multiplicity != v) {
            if (upper)
                multiplicity += ".." + v;
            else
                multiplicity = v + ".." + multiplicity;
        }
    }
}

void Association::import(FileIn & in, Token & token)
{
    WrapperStr s = token.xmiId();
    int index = ((roles[0].id == s)
                 ? 0
                 : ((roles[1].id == s)
                    ? 1
                    : ((roles[0].id.isEmpty()) ? 0 : 1)));
    Role & r = roles[index];

    r.id = s;

    if (!(s = token.valueOf("name")).isEmpty())
        r.name = s;

    if (!(s = token.valueOf("type")).isEmpty())
        r.idref = s;

    if (!(s = token.valueOf("visibility")).isEmpty())
        r.visibility = s;

    s = token.valueOf("isnavigable");
    r.navigable = (s.isEmpty())
                  ? (token.what() != "ownedend")
                  : (s == "true");
    r.readOnly = (token.valueOf("isreadonly") == "true");
    r.isDerived = (token.valueOf("isderived") == "true");
    r.isDerivedUnion = (token.valueOf("isderivedunion") == "true");
    r.isOrdered = (token.valueOf("isordered") == "true");
    r.isUnique = (token.valueOf("isunique") == "true");
    r.isStatic = (token.valueOf("isstatic") == "true");
    r.defaultValue = token.valueOf("defaultvalue");

    s = token.valueOf("aggregation");

    if (s == "shared")
        roles[(UmlItem::fromEclipse()) ? 1 - index : index].aggregate = anAggregation;
    else if ((s == "composite") || (s == "aggregate"))
        roles[(UmlItem::fromEclipse()) ? 1 - index : index].aggregate = anAggregationByValue;

    if (! token.closed()) {
        WrapperStr k = token.what();
        const char * kstr = k;

        while (in.read(), !token.close(kstr)) {
            s = token.what();

            if (s == "type") {
                r.idref = token.xmiIdref();

                if (r.idref.isEmpty() && !(r.idref = token.valueOf("href")).isEmpty()) {
                    int index = r.idref.find('#');

                    if (index == -1)
                        r.idref = "";
                    else
                        r.idref = r.idref.mid(index + 1);
                }
            }
            else if (s == "lowervalue")
                r.setMultiplicity(token.valueOf("value"), FALSE,
                                  (UmlItem::fromEclipse()) ? "0" : "");
            else if (s == "uppervalue")
                r.setMultiplicity(token.valueOf("value"), TRUE,
                                  (UmlItem::fromEclipse()) ? "0" : "");
            else if (s == "ownedcomment") {
                r.comment = UmlItem::readComment(in, token);
                continue;
            }
            else if (s == "ownedrule") {
                r.constraint = UmlItem::readConstraint(in, token);
                continue;
            }
            else if (s == "defaultvalue")
                r.defaultValue = token.valueOf("value");
            else {
                in.bypass(token);
                continue;
            }

            if (! token.closed())
                in.finish(s);
        }
    }
}

Association & Association::get(WrapperStr id, WrapperStr s)
{
    QMap<WrapperStr, Association>::Iterator it = All.find(id);

    if (it == All.end()) {
        Association a;

        it = All.insert(id, a);
    }

    if (!s.isEmpty() &&
        (!UmlItem::fromEclipse() || (s.find("Association_") != 0)))
        (*it).name = s;

    return *it;
}

void Association::solveThem()
{
    QMap<WrapperStr, Association>::Iterator it;

    for (it = All.begin(); it != All.end(); ++it)
        (*it).solve(it.key());

    All.clear();
}

QMap<WrapperStr, Association> Association::All;

void Association::solve(WrapperStr id)
{
    if (roles[0].id.isEmpty() || roles[0].idref.isEmpty() ||
        roles[1].id.isEmpty() || roles[1].idref.isEmpty())
        UmlCom::trace("association '" + id + "' not fully defined<br>");
    else {
        int rank;

        if (!roles[0].navigable)
            rank = 1;
        else if (!roles[1].navigable)
            rank = 0;
        else if (roles[0].aggregate == anAssociation)
            rank = 0;
        else
            rank = 1;

        Role & a = roles[rank];
        Role & b = roles[1 - rank];
        QMap<WrapperStr, UmlItem *>::Iterator it;

        if ((it = UmlItem::All.find(a.idref)) == UmlItem::All.end()) {
            if (!FileIn::isBypassedId(a.idref))
                UmlCom::trace("association : unknown reference '" + a.idref + "'<br>");
        }
        else if ((*it)->kind() == aClass) {
            UmlClass * cla = (UmlClass *) *it;

            if ((it = UmlItem::All.find(b.idref)) == UmlItem::All.end()) {
                if (!FileIn::isBypassedId(b.idref))
                    UmlCom::trace("association : unknown reference '" + b.idref + "'<br>");
            }
            else if ((*it)->kind() == aClass) {
                UmlClass * clb = (UmlClass *) *it;
                aRelationKind k;

                if (!b.navigable) {
                    switch (b.aggregate) {
                    case anAssociation:
                        k = aDirectionalAssociation;
                        break;

                    case anAggregationByValue:
                        k = aDirectionalAggregationByValue;
                        break;

                    default:
                        k = aDirectionalAggregation;
                    }
                }
                else
                    k = b.aggregate;

                UmlRelation * ra = UmlRelation::create(k, clb, cla);
                UmlRelation * rb = ra->side(FALSE);
                WrapperStr s;

                if (!name.isEmpty()) {
                    int index = 0;

                    while ((index = name.find('\n', index)) != -1)
                        name.replace(index++, 1, " ");

                    ra->set_Name(name);
                }

                UmlItem::All.insert(a.id, ra);

                if (!a.name.isEmpty())
                    ra->set_RoleName(UmlItem::legalName(a.name));

                ra->setVisibility(a.visibility);

                if (a.readOnly)
                    ra->set_isReadOnly(TRUE);

                if (a.isDerived)
                    ra->set_isDerived(TRUE, a.isDerivedUnion);

                if (a.isOrdered)
                    ra->set_isOrdered(TRUE);

                if (a.isUnique)
                    ra->set_isUnique(TRUE);

                if (a.isStatic)
                    ra->set_isClassMember(TRUE);

                if (! a.multiplicity.isEmpty())
                    ra->set_Multiplicity(a.multiplicity);

                if (! a.comment.isEmpty())
                    ra->set_Description(a.comment);

                if (! a.constraint.isEmpty())
                    ra->set_Constraint(a.constraint);

                if (! a.defaultValue.isEmpty())
                    ra->set_DefaultValue(a.defaultValue);

                if (is_class_association) {
                    UmlTypeSpec t;

                    t.type = (UmlClass *) UmlItem::All[id];	// exist !
                    ra->set_Association(t);
                }

                if (rb != 0) {
                    UmlItem::All.insert(b.id, rb);

                    if (!b.name.isEmpty())
                        rb->set_RoleName(UmlItem::legalName(b.name));

                    rb->setVisibility(b.visibility);

                    if (b.readOnly)
                        rb->set_isReadOnly(TRUE);

                    if (b.isDerived)
                        rb->set_isDerived(TRUE, b.isDerivedUnion);

                    if (b.isOrdered)
                        rb->set_isOrdered(TRUE);

                    if (b.isUnique)
                        rb->set_isUnique(TRUE);

                    if (b.isStatic)
                        rb->set_isClassMember(TRUE);

                    if (! b.multiplicity.isEmpty())
                        rb->set_Multiplicity(b.multiplicity);

                    if (! b.comment.isEmpty())
                        rb->set_Description(b.comment);

                    if (! b.constraint.isEmpty())
                        rb->set_Constraint(b.constraint);

                    if (! b.defaultValue.isEmpty())
                        rb->set_DefaultValue(b.defaultValue);
                }
            }
        }
    }
}

