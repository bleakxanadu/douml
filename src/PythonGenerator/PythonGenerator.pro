TEMPLATE      = app
CONFIG          += qt warn_on
SOURCES          = UmlClassItem.cpp UmlAttribute.cpp \
        UmlClass.cpp UmlClassDiagram.cpp UmlClassMember.cpp \
        UmlExtraClassMember.cpp UmlArtifact.cpp \
        UmlClassView.cpp UmlCollaborationDiagram.cpp UmlComponent.cpp \
        UmlComponentDiagram.cpp UmlComponentView.cpp \
        UmlDeploymentDiagram.cpp UmlDeploymentView.cpp UmlDiagram.cpp \
        UmlItem.cpp UmlNode.cpp UmlOperation.cpp UmlPackage.cpp \
        UmlRelation.cpp UmlNcRelation.cpp UmlSequenceDiagram.cpp UmlUseCase.cpp \
        UmlUseCaseDiagram.cpp UmlUseCaseView.cpp main.cpp util.cpp \
        UmlChoicePseudoState.cpp UmlDeepHistoryPseudoState.cpp \
        UmlEntryPointPseudoState.cpp UmlExitPointPseudoState.cpp \
        UmlFinalState.cpp UmlForkPseudoState.cpp \
        UmlInitialPseudoState.cpp UmlJoinPseudoState.cpp \
        UmlJunctionPseudoState.cpp UmlShallowHistoryPseudoState.cpp \
        UmlStateAction.cpp UmlState.cpp \
        UmlStateDiagram.cpp UmlTerminatePseudoState.cpp \
        UmlRegion.cpp \
        UmlAccessVariableValueAction.cpp \
        UmlOnSignalAction.cpp \
        UmlPinParameter.cpp \
        UmlActivityObject.cpp \
        UmlActivityAction.cpp \
        UmlActivityPin.cpp \
        UmlActivityRegion.cpp \
        UmlActivityControlNodeClasses.cpp \
        UmlActivityActionClasses.cpp \
        UmlExpansionNode.cpp \
        UmlActivityDiagram.cpp \
        UmlFlow.cpp \
        UmlParameterSet.cpp \
        UmlActivityParameter.cpp \
        UmlObjectDiagram.cpp \
        UmlActualParameter.cpp \
        UmlFormalParameter.cpp \
        UmlExpansionRegion.cpp \
        UmlActivity.cpp \
        UmlInterruptibleActivityRegion.cpp \
        UmlTypeSpec.cpp \
        UmlClassInstance.cpp \
        ../Tools/UmlBaseClassItem.cpp ../Tools/UmlBaseClassMember.cpp \
        ../Tools/UmlBaseExtraClassMember.cpp ../Tools/PythonSettings.cpp \
        ../Tools/UmlBaseArtifact.cpp \
        ../Tools/UmlBaseAttribute.cpp ../Tools/UmlBaseClass.cpp \
        ../Tools/UmlBaseClassDiagram.cpp ../Tools/UmlBaseClassView.cpp \
        ../Tools/UmlBaseCollaborationDiagram.cpp ../Tools/UmlBaseComponent.cpp \
        ../Tools/UmlBaseComponentDiagram.cpp ../Tools/UmlBaseComponentView.cpp \
        ../Tools/UmlBaseDeploymentDiagram.cpp ../Tools/UmlBaseDeploymentView.cpp \
        ../Tools/UmlBaseDiagram.cpp ../Tools/UmlBaseItem.cpp \
        ../Tools/UmlBaseNode.cpp ../Tools/UmlBaseOperation.cpp \
        ../Tools/UmlBasePackage.cpp ../Tools/UmlBaseRelation.cpp \
        ../Tools/UmlBaseNcRelation.cpp \
        ../Tools/UmlBaseSequenceDiagram.cpp ../Tools/UmlBaseUseCase.cpp \
        ../Tools/UmlBaseUseCaseDiagram.cpp ../Tools/UmlBaseUseCaseView.cpp \
        ../Tools/UmlCom.cpp ../Tools/UmlSettings.cpp \
        ../Tools/UmlBaseChoicePseudoState.cpp ../Tools/UmlBaseDeepHistoryPseudoState.cpp \
        ../Tools/UmlBaseEntryPointPseudoState.cpp ../Tools/UmlBaseExitPointPseudoState.cpp \
        ../Tools/UmlBaseFinalState.cpp ../Tools/UmlBaseForkPseudoState.cpp \
        ../Tools/UmlBaseInitialPseudoState.cpp ../Tools/UmlBaseJoinPseudoState.cpp \
        ../Tools/UmlBaseJunctionPseudoState.cpp ../Tools/UmlBaseShallowHistoryPseudoState.cpp \
        ../Tools/UmlBaseStateAction.cpp ../Tools/UmlBaseState.cpp \
        ../Tools/UmlBaseStateDiagram.cpp ../Tools/UmlBaseTerminatePseudoState.cpp \
        ../Tools/UmlBaseRegion.cpp ../Tools/StateBehavior.cpp ../Tools/UmlBaseTransition.cpp \
        ../Tools/TransitionBehavior.cpp \
        ../Tools/UmlBaseAccessVariableValueAction.cpp \
        ../Tools/UmlBaseOnSignalAction.cpp \
        ../Tools/UmlBasePinParameter.cpp \
        ../Tools/UmlBaseActivityObject.cpp \
        ../Tools/UmlBaseActivityAction.cpp \
        ../Tools/UmlBaseActivityPin.cpp \
        ../Tools/UmlBaseActivityRegion.cpp \
        ../Tools/UmlBaseActivityPartition.cpp \
        ../Tools/UmlBaseActivityControlNodeClasses.cpp \
        ../Tools/UmlBaseActivityActionClasses.cpp \
        ../Tools/UmlBaseExpansionNode.cpp \
        ../Tools/UmlBaseActivityDiagram.cpp \
        ../Tools/UmlBaseFlow.cpp \
        ../Tools/UmlBaseParameterSet.cpp \
        ../Tools/UmlBaseActivityParameter.cpp \
        ../Tools/UmlBaseObjectDiagram.cpp \
        ../Tools/UmlBaseActualParameter.cpp \
        ../Tools/UmlBaseFormalParameter.cpp \
        ../Tools/UmlBaseExpansionRegion.cpp \
        ../Tools/UmlBaseActivity.cpp \
        ../Tools/UmlBaseInterruptibleActivityRegion.cpp \
        ../Tools/FlowBehavior.cpp \
        ../Tools/UmlBaseTypeSpec.cpp \
        ../Tools/UmlBaseParameter.cpp \
        ../Tools/UmlBaseView.cpp \
        ../Tools/UmlBaseClassInstance.cpp \
    ../misc/mystr.cpp \
    ../Logging/QsLogDest.cpp \
    ../Logging/QsLog.cpp \
    ../Logging/QsDebugOutput.cpp
TARGET          = python_generator
DEFINES          = WITHPYTHON BooL=bool
INCLUDEPATH   = ../Tools ../PythonGenerator ../
DESTDIR = ../../bin

#The following line was inserted by qt3to4
QT += network  qt3support 
INCLUDEPATH += ../../src
CONFIG += qtestlib
Release{


    MOC_DIR = bin/douml/py_gen/MOC_release
    OBJECTS_DIR = bin/douml/py_gen/Obj_release
}

Debug{
    MOC_DIR = bin/douml/py_gen/MOC_Debug
    OBJECTS_DIR = bin/douml/py_gen/Obj_Debug

}
    UI_DIR = src/ui
    DESTDIR = ../../bin

QMAKE_CXXFLAGS += -std=gnu++11
