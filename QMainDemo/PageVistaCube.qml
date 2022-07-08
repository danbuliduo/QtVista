import QtQuick
import QtQuick.Controls
import QtDataVisualization

Page{
    Bars3D {
            id: bars3D
            theme: theme3D
            width: Math.min(parent.width, parent.height)
            height: Math.min(parent.width, parent.height)
            scene.activeCamera.xRotation: 80.0
            scene.activeCamera.yRotation: 80.0
            //scene.activeCamera.zoomLevel: Math.min(parent.height, parent.width)
            Bar3DSeries {
                id: bar3DSeries
                itemLabelFormat: "@colLabel, @rowLabel: @valueLabel"
                ItemModelBarDataProxy {
                    itemModel: dataModel
                    rowRole: "year"
                    columnRole: "city"
                    valueRole: "expenses"
                }
            }
        }
        ThemeColor {
            id: themeColor
            color: application.Material.accentColor
        }
        Theme3D {
            id: theme3D
            type: Theme3D.ThemeEbony
            baseColors : [themeColor]
            font.pointSize: 100
            //labelBorderEnabled: false
            //labelBackgroundColor: "transparent"
           // labelTextColor: "#FFFFFF"
            backgroundColor: "transparent"
            //gridLineColor: "#DDDDDD"
            //windowColor: application.Material.backgroundColor
        }
        ListModel {
            id: dataModel
            ListElement{ year: "2019"; city: "北京"; price: "57822"; }
            ListElement{ year: "2019"; city: "南京"; price: "36714"; }
            ListElement{ year: "2019"; city: "深圳"; price: "40900"; }
            ListElement{ year: "2019"; city: "杭州"; price: "40729"; }
            ListElement{ year: "2018"; city: "北京"; price: "67822"; }
            ListElement{ year: "2018"; city: "南京"; price: "26714"; }
            ListElement{ year: "2018"; city: "深圳"; price: "50900"; }
            ListElement{ year: "2018"; city: "杭州"; price: "30729"; }
            ListElement{ year: "2017"; city: "北京"; price: "67951"; }
            ListElement{ year: "2017"; city: "南京"; price: "26127"; }
            ListElement{ year: "2017"; city: "深圳"; price: "46879"; }
            ListElement{ year: "2017"; city: "杭州"; price: "22934"; }
        }

        SequentialAnimation {
            running: true
            loops: Animation.Infinite
            NumberAnimation {
                target: bars3D.scene.activeCamera
                property:"xRotation"
                from: 80.0; to: 10.0
                duration: 5000
            }
            NumberAnimation {
                target: bars3D.scene.activeCamera
                property:"yRotation"
                from: 80.0; to: 10.0
                duration: 5000
            }
            NumberAnimation {
                target: bars3D.scene.activeCamera
                property:"xRotation"
                from: 10.0; to: 80.0
                duration: 5000
            }
            NumberAnimation {
                target: bars3D.scene.activeCamera
                property:"yRotation"
                from: 10.0; to: 80.0
                duration: 5000
            }
        }

}

