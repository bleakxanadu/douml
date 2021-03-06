TEMPLATE  =  app
INCLUDEPATH    += browser data diagram dialog misc tool xpm
DEPENDPATH += browser data diagram dialog misc tool xpm
INCLUDEPATH += boost src ui .. $$PWD
#CONFIG        += qt warn_on debug
CONFIG(debug, debug|release) {
    CONFIG -= debug release
    CONFIG += qt warn_on debug
    QMAKE_POST_LINK = " "
}
CONFIG(release, debug|release) {
    CONFIG -= debug release
    CONFIG += qt release
    QMAKE_POST_LINK = " "
}
HEADERS        = \
        data/ActualParamData.h \
        data/BasicData.h \
        data/SimpleData.h \
        data/ClassMemberData.h \
        data/AttributeData.h \
        data/ExtraMemberData.h \
        data/ClassData.h \
        data/ArtifactData.h \
        data/ExceptionData.h \
        data/FormalParamData.h \
        data/HaveKeyValueData.h \
        data/KeyValueData.h \
        data/OperationData.h \
        data/PackageData.h \
        data/ParamData.h \
        data/RelationData.h \
        data/SimpleRelationData.h \
        data/TransitionData.h \
        data/StateData.h \
        data/PseudoStateData.h \
        data/StateActionData.h \
        data/ActivityData.h \
        data/ParameterData.h \
        data/ObjectData.h \
        data/PinParamData.h \
        data/ParameterSetData.h \
        data/InfoData.h \
        data/ActivityActionData.h \
        data/PinData.h \
        data/ExpansionRegionData.h \
        data/ActivityObjectData.h \
        data/ActivityPartitionData.h \
        data/FlowData.h \
        data/ClassInstanceData.h \
        data/UseCaseData.h \
        diagram/ArrowCanvas.h \
        diagram/HubCanvas.h \
        diagram/AssocContainCanvas.h \
        diagram/ArrowPointCanvas.h \
        diagram/BrowserView.h \
        diagram/CdClassCanvas.h \
        diagram/ClassDiagramView.h \
        diagram/ClassDiagramWindow.h \
        diagram/DiagramCanvas.h \
        diagram/DiagramItem.h \
        diagram/DiagramView.h \
        diagram/DiagramWindow.h \
        diagram/FragmentCanvas.h \
        diagram/SubjectCanvas.h \
        diagram/LabelCanvas.h \
        diagram/NoteCanvas.h \
        diagram/ImageCanvas.h \
        diagram/PackageCanvas.h \
        diagram/RelationCanvas.h \
        diagram/SimpleRelationCanvas.h \
        diagram/TransitionCanvas.h \
        diagram/ObjectLinkCanvas.h \
        diagram/ClassInstCanvas.h \
        diagram/SdClassInstCanvas.h \
        diagram/SdDurationCanvas.h \
        diagram/SdContinuationCanvas.h \
        diagram/SdLifeLineCanvas.h \
        diagram/SdMsgBaseCanvas.h \
        diagram/SdMsgCanvas.h \
        diagram/SdObjCanvas.h \
        diagram/SdLostFoundMsgSupportCanvas.h \
        diagram/SdSelfMsgCanvas.h \
        diagram/SelectAreaCanvas.h \
        diagram/SeqDiagramView.h \
        diagram/SeqDiagramWindow.h \
        diagram/TextCanvas.h \
        diagram/IconCanvas.h \
        diagram/UcClassCanvas.h \
        diagram/UcUseCaseCanvas.h \
        diagram/UmlCanvas.h \
        diagram/UmlWindow.h \
        diagram/UmlDesktop.h \
        diagram/UseCaseDiagramView.h \
        diagram/UseCaseDiagramWindow.h \
        diagram/ColDiagramView.h \
        diagram/ColDiagramWindow.h \
        diagram/ObjectDiagramView.h \
        diagram/ObjectDiagramWindow.h \
        diagram/CodClassInstCanvas.h \
        diagram/OdClassInstCanvas.h \
        diagram/CodObjCanvas.h \
        diagram/CodLinkCanvas.h \
        diagram/CodSelfLinkCanvas.h \
        diagram/CodDirsCanvas.h \
        diagram/ComponentDiagramView.h \
        diagram/ComponentDiagramWindow.h \
        diagram/DeploymentDiagramView.h \
        diagram/DeploymentDiagramWindow.h \
        diagram/ComponentCanvas.h \
        diagram/ArtifactCanvas.h \
        diagram/DeploymentNodeCanvas.h \
        diagram/ArrowJunctionCanvas.h \
        diagram/StateDiagramView.h \
        diagram/StateDiagramWindow.h \
        diagram/StateCanvas.h \
        diagram/PseudoStateCanvas.h \
        diagram/StateActionCanvas.h \
        diagram/ActivityDiagramView.h \
        diagram/ActivityDiagramWindow.h \
        diagram/ActivityContainerCanvas.h \
        diagram/ActivityCanvas.h \
        diagram/ActivityNodeCanvas.h \
        diagram/ActivityActionCanvas.h \
        diagram/ParameterCanvas.h \
        diagram/PinCanvas.h \
        diagram/InfoCanvas.h \
        diagram/ParameterSetCanvas.h \
        diagram/InterruptibleActivityRegionCanvas.h \
        diagram/ExpansionRegionCanvas.h \
        diagram/ActivityObjectCanvas.h \
        diagram/ActivityPartitionCanvas.h \
        diagram/ExpansionNodeCanvas.h \
        diagram/FlowCanvas.h \
        diagram/FragmentSeparatorCanvas.h \
        diagram/ConstraintCanvas.h \
        diagram/StereotypePropertiesCanvas.h \
        dialog/AttributeDialog.h \
        dialog/ExtraMemberDialog.h \
        dialog/BasicDialog.h \
        dialog/ClassDialog.h \
        dialog/ClassListDialog.h \
        dialog/ClassViewDialog.h \
        dialog/ClassSettingsDialog.h \
        dialog/RevSettingsDialog.h \
        dialog/HelpRegexpDialog.h \
        dialog/FragmentDialog.h \
        dialog/ContinuationDialog.h \
        dialog/ComboItem.h \
        dialog/MyTable.h \
        dialog/ComponentDialog.h \
        dialog/ArtifactDialog.h \
        dialog/GenerationSettingsDialog.h \
        dialog/SettingsDialog.h \
        dialog/KeyValueTable.h \
        dialog/MLEDialog.h \
        dialog/ReferenceDialog.h \
        dialog/SourceDialog.h \
        dialog/BodyDialog.h \
        dialog/MLinesItem.h \
        dialog/MyInputDialog.h \
        dialog/OperationDialog.h \
        dialog/OperationListDialog.h \
        dialog/PackageDialog.h \
        dialog/RelationDialog.h \
        dialog/SimpleRelationDialog.h \
        dialog/StateDialog.h \
        dialog/PseudoStateDialog.h \
        dialog/StateActionDialog.h \
        dialog/TransitionDialog.h \
        dialog/InstanceDialog.h \
        dialog/ClassInstanceDialog.h \
        dialog/SdMsgDialog.h \
        dialog/StereotypeDialog.h \
        dialog/StereotypesDialog.h \
        dialog/StringTable.h \
        dialog/ToolDialog.h \
        dialog/TraceDialog.h \
        dialog/VisibilityGroup.h \
        dialog/CodAddMsgDialog.h \
        dialog/CodEditMsgDialog.h \
        dialog/MenuFont.h \
        dialog/ColMsgTable.h \
        dialog/CodChangeMsgDialog.h \
        dialog/HideShowDialog.h \
        dialog/BrowserSearchDialog.h \
        dialog/DialogTimer.h \
        dialog/SaveProgress.h \
        dialog/AnnotationDialog.h \
        dialog/ObjectLinkDialog.h \
        dialog/ActivityDialog.h \
        dialog/ParameterDialog.h \
        dialog/ParameterSetDialog.h \
        dialog/PinDialog.h \
        dialog/ActivityActionDialog.h \
        dialog/ExpansionRegionDialog.h \
        dialog/ActivityObjectDialog.h \
        dialog/ActivityPartitionDialog.h \
        dialog/FlowDialog.h \
        dialog/ShortcutDialog.h \
        dialog/UseCaseDialog.h \
        dialog/ConstraintDialog.h \
        dialog/DecoratorDialog.h \
        dialog/HelpDialog.h \
        dialog/EnvDialog.h \
        dialog/GreetingsDialog.h \
        dialog/RelatedElementsDialog.h \
        dialog/ImageDialog.h \
        dialog/DialogUtil.h \
        misc/Settings.h \
        misc/UmlDrag.h \
        misc/UmlEnum.h \
        misc/UmlGlobal.h \
        misc/Labeled.h \
        misc/myio.h \
        misc/mu.h \
        misc/ProfiledStereotypes.h \
        misc/Images.h \
        tool/Tool.h \
        tool/Socket.h \
        tool/ToolCom.h \
        xpm/UmlPixmap.h \
        ui/menufactory.h \
        Factories/EdgeMenuFactory.h \
        dialog/EdgeMenuDialog.h \
        CustomWidgets/EdgeMenuToolBar.h \
        Factories/DialogConnections.h \
        Factories/EdgeToolBarCreation.h \
        CustomWidgets/MultiPurposeDragArea.h \
        misc/ClipboardManager.h \
        ui/operationwidgetcpp.h \
    ui/constructorinitializerdialog.h \
    tagmanagement/cpptagmanagement.h \
    dialog/edgemenudialogqt4.h \
    dialog/edgemenudialogbase.h


SOURCES = \
        browser/BrowserAttribute.cpp \
        browser/BrowserExtraMember.cpp \
        browser/BrowserClass.cpp \
        browser/BrowserClassDiagram.cpp \
        browser/BrowserClassView.cpp \
        browser/BrowserDiagram.cpp \
        browser/BrowserNode.cpp \
        browser/BrowserOperation.cpp \
        browser/BrowserPackage.cpp \
        browser/BrowserRelation.cpp \
        browser/BrowserSimpleRelation.cpp \
        browser/BrowserTransition.cpp \
        browser/BrowserSeqDiagram.cpp \
        browser/BrowserUseCase.cpp \
        browser/BrowserUseCaseDiagram.cpp \
        browser/BrowserUseCaseView.cpp \
        browser/BrowserColDiagram.cpp \
        browser/BrowserObjectDiagram.cpp \
        browser/BrowserComponent.cpp \
        browser/BrowserComponentView.cpp \
        browser/BrowserComponentDiagram.cpp \
        browser/BrowserDeploymentNode.cpp \
        browser/BrowserDeploymentView.cpp \
        browser/BrowserDeploymentDiagram.cpp \
        browser/BrowserArtifact.cpp \
        browser/BrowserState.cpp \
        browser/BrowserRegion.cpp \
        browser/BrowserPseudoState.cpp \
        browser/BrowserStateAction.cpp \
        browser/BrowserStateDiagram.cpp \
        browser/BrowserActivity.cpp \
        browser/BrowserActivityNode.cpp \
        browser/BrowserActivityDiagram.cpp \
        browser/BrowserParameter.cpp \
        browser/BrowserParameterSet.cpp \
        browser/BrowserActivityAction.cpp \
        browser/BrowserPin.cpp \
        browser/BrowserInterruptibleActivityRegion.cpp \
        browser/BrowserExpansionRegion.cpp \
        browser/BrowserExpansionNode.cpp \
        browser/BrowserActivityObject.cpp \
        browser/BrowserActivityPartition.cpp \
        browser/BrowserFlow.cpp \
        browser/BrowserClassInstance.cpp \
        data/ActualParamData.cpp \
        data/AttributeData.cpp \
        data/ExtraMemberData.cpp \
        data/AType.cpp \
        data/ClassData.cpp \
        data/ArtifactData.cpp \
        data/ExceptionData.cpp \
        data/FormalParamData.cpp \
        data/HaveKeyValueData.cpp \
        data/KeyValueData.cpp \
        data/BasicData.cpp \
        data/ClassMemberData.cpp \
        data/SimpleData.cpp \
        data/OperationData.cpp \
        data/PackageData.cpp \
        data/ParamData.cpp \
        data/RelationData.cpp \
        data/SimpleRelationData.cpp \
        data/TransitionData.cpp \
        data/StateData.cpp \
        data/PseudoStateData.cpp \
        data/StateActionData.cpp \
        data/ActivityData.cpp \
        data/ParameterData.cpp \
        data/ObjectData.cpp \
        data/PinParamData.cpp \
        data/ParameterSetData.cpp \
        data/InfoData.cpp \
        data/ActivityActionData.cpp \
        data/PinData.cpp \
        data/ExpansionRegionData.cpp \
        data/ActivityObjectData.cpp \
        data/ActivityPartitionData.cpp \
        data/FlowData.cpp \
        data/ClassInstanceData.cpp \
        data/UseCaseData.cpp \
        diagram/ArrowCanvas.cpp \
        diagram/HubCanvas.cpp \
        diagram/AssocContainCanvas.cpp \
        diagram/ArrowPointCanvas.cpp \
        diagram/BrowserView.cpp \
        diagram/CdClassCanvas.cpp \
        diagram/ClassDiagramView.cpp \
        diagram/ClassDiagramWindow.cpp \
        diagram/DiagramCanvas.cpp \
        diagram/DiagramItem.cpp \
        diagram/DiagramView.cpp \
        diagram/DiagramWindow.cpp \
        diagram/FragmentCanvas.cpp \
        diagram/SubjectCanvas.cpp \
        diagram/LabelCanvas.cpp \
        diagram/NoteCanvas.cpp \
        diagram/ImageCanvas.cpp \
        diagram/PackageCanvas.cpp \
        diagram/RelationCanvas.cpp \
        diagram/SimpleRelationCanvas.cpp \
        diagram/TransitionCanvas.cpp \
        diagram/ObjectLinkCanvas.cpp \
        diagram/ClassInstCanvas.cpp \
        diagram/SdClassInstCanvas.cpp \
        diagram/SdDurationCanvas.cpp \
        diagram/SdContinuationCanvas.cpp \
        diagram/SdLifeLineCanvas.cpp \
        diagram/SdMsgBaseCanvas.cpp \
        diagram/SdMsgCanvas.cpp \
        diagram/SdObjCanvas.cpp \
        diagram/SdLostFoundMsgSupportCanvas.cpp \
        diagram/SdSelfMsgCanvas.cpp \
        diagram/SelectAreaCanvas.cpp \
        diagram/SeqDiagramView.cpp \
        diagram/SeqDiagramWindow.cpp \
        diagram/TemplateCanvas.cpp \
        diagram/TextCanvas.cpp \
        diagram/IconCanvas.cpp \
        diagram/UcClassCanvas.cpp \
        diagram/UcUseCaseCanvas.cpp \
        diagram/UmlCanvas.cpp \
        diagram/UmlWindow.cpp \
        diagram/UmlDesktop.cpp \
        diagram/UseCaseDiagramView.cpp \
        diagram/UseCaseDiagramWindow.cpp \
        diagram/ColDiagramView.cpp \
        diagram/ColDiagramWindow.cpp \
        diagram/ObjectDiagramView.cpp \
        diagram/ObjectDiagramWindow.cpp \
        diagram/CodClassInstCanvas.cpp \
        diagram/OdClassInstCanvas.cpp \
        diagram/CodObjCanvas.cpp \
        diagram/CodLinkCanvas.cpp \
        diagram/CodSelfLinkCanvas.cpp \
        diagram/CodDirsCanvas.cpp \
        diagram/ColMsg.cpp \
        diagram/CodMsgSupport.cpp \
        diagram/ComponentDiagramView.cpp \
        diagram/ComponentDiagramWindow.cpp \
        diagram/DeploymentDiagramView.cpp \
        diagram/DeploymentDiagramWindow.cpp \
        diagram/DeploymentNodeCanvas.cpp \
        diagram/ComponentCanvas.cpp \
        diagram/ArtifactCanvas.cpp \
        diagram/ArrowJunctionCanvas.cpp \
        diagram/StateDiagramView.cpp \
        diagram/StateDiagramWindow.cpp \
        diagram/StateCanvas.cpp \
        diagram/PseudoStateCanvas.cpp \
        diagram/StateActionCanvas.cpp \
        diagram/ActivityDiagramView.cpp \
        diagram/ActivityDiagramWindow.cpp \
        diagram/ActivityContainerCanvas.cpp \
        diagram/ActivityCanvas.cpp \
        diagram/ActivityNodeCanvas.cpp \
        diagram/ActivityActionCanvas.cpp \
        diagram/ParameterCanvas.cpp \
        diagram/PinCanvas.cpp \
        diagram/InfoCanvas.cpp \
        diagram/ParameterSetCanvas.cpp \
        diagram/InterruptibleActivityRegionCanvas.cpp \
        diagram/ExpansionRegionCanvas.cpp \
        diagram/ActivityObjectCanvas.cpp \
        diagram/ActivityPartitionCanvas.cpp \
        diagram/ExpansionNodeCanvas.cpp \
        diagram/FlowCanvas.cpp \
        diagram/FragmentSeparatorCanvas.cpp \
        diagram/ConstraintCanvas.cpp \
        diagram/StereotypePropertiesCanvas.cpp \
        dialog/AttributeDialog.cpp \
        dialog/ExtraMemberDialog.cpp \
        dialog/BasicDialog.cpp \
        dialog/ClassDialog.cpp \
        dialog/ClassListDialog.cpp \
        dialog/ClassViewDialog.cpp \
        dialog/ClassSettingsDialog.cpp \
        dialog/RevSettingsDialog.cpp \
        dialog/ComboItem.cpp \
        dialog/FragmentDialog.cpp \
        dialog/ContinuationDialog.cpp \
        dialog/MyTable.cpp \
        dialog/ComponentDialog.cpp \
        dialog/ArtifactDialog.cpp \
        dialog/DialogUtil.cpp \
        dialog/GenerationSettingsDialog.cpp \
        dialog/SettingsDialog.cpp \
        dialog/StateSpec.cpp \
        dialog/KeyValueTable.cpp \
        dialog/MLEDialog.cpp \
        dialog/SourceDialog.cpp \
        dialog/BodyDialog.cpp \
        dialog/MLinesItem.cpp \
        dialog/MyInputDialog.cpp \
        dialog/OperationDialog.cpp \
        dialog/OperationListDialog.cpp \
        dialog/PackageDialog.cpp \
        dialog/RelationDialog.cpp \
        dialog/ReferenceDialog.cpp \
        dialog/SimpleRelationDialog.cpp \
        dialog/StateDialog.cpp \
        dialog/PseudoStateDialog.cpp \
        dialog/StateActionDialog.cpp \
        dialog/TransitionDialog.cpp \
        dialog/InstanceDialog.cpp \
        dialog/ClassInstanceDialog.cpp \
        dialog/SdMsgDialog.cpp \
        dialog/StereotypeDialog.cpp \
        dialog/StereotypesDialog.cpp \
        dialog/StringTable.cpp \
        dialog/ToolDialog.cpp \
        dialog/TraceDialog.cpp \
        dialog/VisibilityGroup.cpp \
        dialog/CodAddMsgDialog.cpp \
        dialog/CodEditMsgDialog.cpp \
        dialog/MenuFont.cpp \
        dialog/ColMsgTable.cpp \
        dialog/CodChangeMsgDialog.cpp \
        dialog/HideShowDialog.cpp \
        dialog/BrowserSearchDialog.cpp \
        dialog/DialogTimer.cpp \
        dialog/About.cpp \
        dialog/SaveProgress.cpp \
        dialog/AnnotationDialog.cpp \
        dialog/ObjectLinkDialog.cpp \
        dialog/ActivityDialog.cpp \
        dialog/ParameterDialog.cpp \
        dialog/ParameterSetDialog.cpp \
        dialog/PinDialog.cpp \
        dialog/ActivityActionDialog.cpp \
        dialog/ExpansionRegionDialog.cpp \
        dialog/ActivityObjectDialog.cpp \
        dialog/ActivityPartitionDialog.cpp \
        dialog/FlowDialog.cpp \
        dialog/ShortcutDialog.cpp \
        dialog/UseCaseDialog.cpp \
        dialog/ConstraintDialog.cpp \
        dialog/DecoratorDialog.cpp \
        dialog/HelpDialog.cpp \
        dialog/EnvDialog.cpp \
        dialog/GreetingsDialog.cpp \
        dialog/RelatedElementsDialog.cpp \
        dialog/ImageDialog.cpp \
        misc/Settings.cpp \
        misc/UmlDrag.cpp \
        misc/UmlGlobal.cpp \
        misc/GenerationSettings.cpp \
        misc/myio.cpp \
        misc/mu.cpp \
        misc/Labeled.cpp \
        misc/mystr.cpp \
        misc/strutil.cpp \
        misc/Shortcut.cpp \
        misc/ProfiledStereotypes.cpp \
        misc/Images.cpp \
        misc/translate.cpp \
        tool/Tool.cpp \
        tool/ToolCom.cpp \
        xpm/UmlPixmap.cpp \
        ui/menufactory.cpp \
        Logging/QsLogDest.cpp \
        Logging/QsLog.cpp \
        Logging/QsDebugOutput.cpp \
        main.cpp \
        Factories/EdgeMenuFactory.cpp \
        dialog/EdgeMenuDialog.cpp \
        misc/GenerateTypeId.cpp \
        Factories/EdgeToolBarCreation.cpp \
        CustomWidgets/MultiPurposeDragArea.cpp \
        CustomWidgets/EdgeMenuToolBar.cpp \
        misc/ClipboardManager.cpp \
        ui/operationwidgetcpp.cpp \
    ui/constructorinitializerdialog.cpp \
    tagmanagement/cpptagmanagement.cpp \
    dialog/edgemenudialogqt4.cpp \
    dialog/edgemenudialogbase.cpp \
    misc/codec.cpp

TARGET = douml
DEFINES = BooL=bool DEBUGCOM

#The following line was inserted by qt3to4
QT += core gui network  qt3support

#release{
#    MOC_DIR = bin/douml/MOC_release
#    OBJECTS_DIR = bin/douml/OBJ_release
#}
#
#debug{
#    MOC_DIR = bin/douml/MOC_debug
#    OBJECTS_DIR = bin/douml/OBJ_debug
#}

win32{
    Release:
        MOC_DIR = $$PWD/../bin/release/win32/$$TARGET
        OBJECTS_DIR = $$PWD/../bin/release/win32/$$TARGET
        DESTDIR = $$PWD/../bin/release/win32/$$TARGET
    Debug:
        MOC_DIR = $$PWD/../bin/debug/win32/$$TARGET
        OBJECTS_DIR = $$PWD/../bin/debug/win32/$$TARGET
        DESTDIR = $$PWD/../bin/debug/win32/$$TARGET
}
macx{
    Release:
        MOC_DIR = $$PWD/../bin/release/macx/$$TARGET
        OBJECTS_DIR = $$PWD/../bin/release/macx/$$TARGET
        DESTDIR = $$PWD/../bin/release/macx/$$TARGET
    Debug:
        MOC_DIR = $$PWD/../bin/debug/macx/$$TARGET
        OBJECTS_DIR = $$PWD/../bin/debug/macx/$$TARGET
        DESTDIR = $$PWD/../bin/debug/macx/$$TARGET
}
unix{
    Release:
        MOC_DIR = $$PWD/../bin/release/unix/$$TARGET
        OBJECTS_DIR = $$PWD/../bin/release/unix/$$TARGET
        DESTDIR = $$PWD/../bin/release/unix/$$TARGET
    Debug:
        MOC_DIR = $$PWD/../bin/debug/unix/$$TARGET
        OBJECTS_DIR = $$PWD/../bin/debug/unix/$$TARGET
        DESTDIR = $$PWD/../bin/debug/unix/$$TARGET
}

UI_DIR = ui
DESTDIR = ../bin

QMAKE_CXXFLAGS += -std=gnu++11

RESOURCES += icons.qrc

FORMS += \
    ui/operationwidgetcpp.ui \
    ui/constructorinitializerdialog.ui

