cmake_minimum_required(VERSION 3.16)

project(MarbleQml VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick WebEngineQuick)
find_package(Marble REQUIRED)
qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appMarbleQml
    main.cpp
)

qt_add_qml_module(appMarbleQml
    URI MarbleQml
    VERSION 1.0
    QML_FILES
        Main.qml
        toolsComponent/ToolsItem.qml
    DEPENDENCIES
        org.kde.marble
        QML_FILES toolsComponent/IconButtonItem.qml
        RESOURCES icons/minus.png icons/plus.svg
        RESOURCES icons/location.png

)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appMarbleQml PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appMarbleQml
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appMarbleQml
    PRIVATE Marble Qt6::Quick Qt6::WebEngineQuick
)

include(GNUInstallDirs)
install(TARGETS appMarbleQml
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/icons
     DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
