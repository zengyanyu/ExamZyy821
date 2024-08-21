import { Message } from '../../components/Message'
import { TabBarClass } from '../../viewmodels'

@Entry
@Component
struct Index {
  @State
  tabList: TabBarClass[] = [
    {
      icon: $r('app.media.ic_public_message'),
      name: 'task',
      title: '任务',
      selectIcon: $r('app.media.ic_public_message_filled')
    },
    {
      icon: $r('app.media.ic_gallery_discover'),
      name: 'message',
      title: '消息',
      selectIcon: $r('app.media.ic_gallery_discover_filled')
    }, {
    icon: $r('app.media.ic_public_contacts'),
    name: 'my',
    title: '我的',
    selectIcon: $r('app.media.ic_public_contacts_filled')
  }]
  @State
  activeIndex: number = 1 // 默认选中消息

  @Builder
  myTabBar(item: TabBarClass) {
    Column({ space: 4 }) {
      Image(this.tabList[this.activeIndex].name === item.name ? item.selectIcon : item.icon)
        .width(20)
        .height(20)
        .fillColor(this.tabList[this.activeIndex].name === item.name ? Color.Red :
        $r('app.color.text_primary'))
      Text(item.title)
        .fontSize(12)
        .fontColor(this.tabList[this.activeIndex].name === item.name ? Color.Red :
        $r('app.color.text_primary'))
    }
  }

  build() {
    Tabs({ index: $$this.activeIndex }) {
      ForEach(this.tabList, (item: TabBarClass) => {
        TabContent() {
          if (item.name === 'message') {
            Message()
          }
        }
        .tabBar(this.myTabBar(item))
      })
    }
    .barPosition(BarPosition.End)
  }
}

