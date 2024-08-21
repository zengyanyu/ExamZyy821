import { TabBarClass } from '../viewmodels'
import { Notice } from './Notice'
import { TaskMessage } from './TaskMessage'

@Component
export struct Message {

  @State
  tabList: TabBarClass[] = [
    {
      icon: $r('app.media.ic_public_message'),
      name: 'notice',
      title: '公告',
      selectIcon: $r('app.media.ic_public_message_filled')
    },
    {
      icon: $r('app.media.ic_public_contacts'),
      name: 'taskMessage',
      title: '任务通知',
      selectIcon: $r('app.media.ic_public_contacts_filled')
    }]
  @State
  activeIndex: number = 0 // 默认选中公告

  @Builder
  myTabBar(item: TabBarClass) {
    Column() {
      Text(item.title)
        .fontSize(14)
        .fontWeight(this.tabList[this.activeIndex].name === item.name ? FontWeight.Bold : FontWeight.Normal)
        .fontColor(this.tabList[this.activeIndex].name === item.name ? $r('app.color.black') : 'rgb(226, 226, 226)')
        .border({
          color: Color.Red,
          width: {
            bottom: this.tabList[this.activeIndex].name === item.name ? 5 : 0
          }
        })
    }
  }

  build() {
    Column({ space: 10 }) {
      // 顶部标题(消息)
      Text("消息")
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      // Tabs 公告,任务通知
      Tabs({ index: $$this.activeIndex }) {
        ForEach(this.tabList, (item: TabBarClass) => {
          TabContent() {
            if (item.name === 'notice') {
              // 公告
              Notice()
            } else {
              // 任务通知
              TaskMessage();
            }
          }
          .tabBar(this.myTabBar(item))
        })
      }
      .barPosition(BarPosition.Start)
    }
  }
}