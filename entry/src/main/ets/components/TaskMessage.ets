/**
 * 任务通知
 */
import { getDriverMessageAPI } from '../api';
import {
  MessageDataItem,
  MessageQueryParamModel,
  MessageQueryParamModelModel,
  MessageResponseModel
} from '../viewmodels'
import { HmCard } from './HmCard';
import { HmCardItem } from './HmCardItem';

@Component
export struct TaskMessage {
  @State
  items: MessageDataItem[] = []
  model: MessageQueryParamModelModel = new MessageQueryParamModelModel({
    contentType: 201,
    page: 1,
    pageSize: 10
  } as MessageQueryParamModel)

  aboutToAppear(): void {
    // 调用任务通知
    this.getTaskMessage();
  }

  // 任务通知
  async getTaskMessage() {
    try {
      // 设置参数
      this.model.contentType = 201
      const result = await getDriverMessageAPI(this.model) as MessageResponseModel
      const resItems = result.items;
      this.items = resItems;
    } catch (error) {
      console.log("=========" + JSON.stringify(error.message))
    }
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
      }
      .width('100%')
      .height(70)
      .padding({
        left: 12,
        right: 12
      })


      // 内容
      HmCard({
        HmCardFn: () => {
          this.getContent();
        }
      })

      HmCard({
        HmCardFn: () => {
          this.getContent();
        }
      })
    }
    .backgroundColor('rgb(245, 245, 245)')
    .width('100%')
    .height('100%')
  }

  @Builder
  getContent() {
    Column({ space: 20 }) {
      Text('您有新的运输任务')
        .width('100%')
        .fontSize(18)
        .margin({
          top: 14
        })

      Row() {
      }
      .width('100%')
      .border({
        color: Color.Gray,
        width: {
          bottom: 1
        }
      })

      Row() {
        Text('运输车辆')
          .fontColor(Color.Gray)
          .layoutWeight(1)
        Text('运输路线')
          .fontColor(Color.Gray)
          .maxLines(1)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
          .layoutWeight(1)
      }.width('100%')

      Row() {
        Text('2022.05.04 13:00').fontSize(12)
          .fontColor(Color.Gray)

        Button('查看详情')
          .fontColor(Color.Red)
          .backgroundColor(Color.White)
          .fontSize(14)
          .border({
            color: Color.Red,
            width: 1
          })
      }.width('100%')
      .margin({
        bottom: 14
      })
      .justifyContent(FlexAlign.SpaceBetween)
    }.width('100%')
  }
}