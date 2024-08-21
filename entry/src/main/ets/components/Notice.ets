import { getDriverMessageAPI, getBakAPI } from '../api'
import { RespData } from '../viewmodels'
import {
  MessageDataItem,
  MessageQueryParamModel,
  MessageQueryParamModelModel,
  MessageResponseModel
} from '../viewmodels'
import { promptAction, router } from '@kit.ArkUI'

/**
 * 公告
 */
@Component
export struct Notice {
  @State
  items: MessageDataItem[] = []
  model: MessageQueryParamModelModel = new MessageQueryParamModelModel({
    contentType: 200,
    page: 1,
    pageSize: 10
  } as MessageQueryParamModel)

  aboutToAppear(): void {
    // 调用公告
    this.getDriverMessage();
  }

  async getDriverMessage() {
    try {
      const result = await getDriverMessageAPI(this.model) as MessageResponseModel
      const resItems = result.items;
      // const items = result.data?.items
      this.items = resItems;
    } catch (error) {
      console.log("=========" + JSON.stringify(error.message))
    }
  }

  async getBakReader(item: MessageDataItem) {
    if (item.isRead === 0) {
      const result = await getBakAPI(item.id) as RespData;
    }
    // 页面跳转
    router.pushUrl({
      url: 'pages/Detail/Detail',
      params: item
    })
  }

  build() {
    Column() {
      Row({ space: 10 }) {
        Image($r('app.media.allReader'))
          .width(30)
          .aspectRatio(1)
        Text('全部已读')
          .width('100%')
          .height(70)
          .fontColor(Color.Gray)
      }.width('100%')
      .height(70)
      .padding({
        left: 12,
        right: 12
      })

      Column() {
        ForEach(this.items, (item: MessageDataItem, index: number) => {
          Row({ space: 20 }) {
            Row() {
              /** 消息是否已读，0：未读，1：已读 */
              if (item.isRead === 0) {
                Image($r('app.media.red'))
                  .width(20)
                  .aspectRatio(1)
              }
              Text(item.content)
                .maxLines(1)
                .textOverflow({
                  overflow: TextOverflow.Ellipsis
                })
                .fontSize(14)
            }.layoutWeight(1)
            .width('100%')

            Text(item.created)
              .fontColor(Color.Gray)
              .fontSize(12)
          }
          .onClick(() => {
            // 标记
            this.getBakReader(item);
          })
          .width('100%')
          .backgroundColor(Color.White)
          .padding({
            left: 12,
            right: 12
          })
          .height(50)
          .border({
            color: '#f4f4f4',
            width: {
              bottom: (this.items.length - 1) !== index ? 1 : 0
            }
          })
          .justifyContent(FlexAlign.SpaceBetween)
        })
      }.width('100%')
    }
    .backgroundColor('rgb(245, 245, 245)')
    .width('100%')
    .height('100%')
  }
}