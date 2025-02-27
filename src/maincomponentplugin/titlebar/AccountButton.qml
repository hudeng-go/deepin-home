// SPDX-FileCopyrightText: 2022 UnionTech Software Technology Co., Ltd.

// SPDX-License-Identifier: LGPL-3.0-or-later

import QtQuick 2.11
import QtQuick.Layouts 1.7
import org.deepin.dtk 1.0
import "../api"
import "../router"

// 账户信息按钮
WindowButton {
    // 头像
    Image {
        id: avatar_image
        source: API.isLogin ? API.avatar : "/images/avatar.svg"
        sourceSize.width: 26
        sourceSize.height: 26
        anchors.centerIn: parent
    }
    // 账户相关
    Popup {
        id: accountMenu
        x: avatar_image.x - 100
        y: parent.height
        width: 266
        height: 244
        ColumnLayout {
            anchors.centerIn: parent
            width: 226
            Rectangle {
                width: 48
                height: 48
                radius: 24
                Image {
                    id: avatarImg
                    width: 48
                    height: 48
                    source: API.avatar
                    sourceSize.width: 48
                    sourceSize.height: 48
                }
                Text {
                    anchors.left: avatarImg.right
                    anchors.top: avatarImg.top
                    anchors.leftMargin: 20
                    text: API.nickname
                }
            }
            Button {
                Layout.topMargin: 20
                Layout.fillWidth: true
                height: 40
                ColorSelector.family: Palette.CrystalColor
                text: qsTr("我的收藏")
                onClicked: {
                    Router.showStarsFeedback()
                    accountMenu.close()
                }
            }
            Button {
                Layout.topMargin: 10
                Layout.fillWidth: true
                height: 40
                ColorSelector.family: Palette.CrystalColor
                text: qsTr("反馈广场")
                onClicked: {
                    Router.showAllFeedback()
                    accountMenu.close()
                }
            }
            Button {
                Layout.fillWidth: true
                height: 40
                Layout.topMargin: 20
                text: qsTr("退出账号")
                onClicked: {
                    worker.logout()
                    accountMenu.close()
                }
            }
        }
    }
    onClicked: {
        if(!API.isLogin) {
            worker.login()
            return
        }
        accountMenu.open()
    }
}
