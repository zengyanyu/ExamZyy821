import { getDriverMessageAPI } from '../api'
import { MessageQueryParamModel, MessageQueryParamModelModel } from '../viewmodels'

@Component
export struct Notice {
  model: MessageQueryParamModelModel = new MessageQueryParamModelModel({} as MessageQueryParamModel)

  aboutToAppear(): void {
    this.getDriderMessage();
  }

  async getDriderMessage() {
    const result = await getDriverMessageAPI(this.model)
    AlertDialog.show({ message: JSON.stringify(result) })
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
        left: 20,
        right: 20
      })
    }
    .backgroundColor('rgb(245, 245, 245)')
    // .justifyContent(FlexAlign.Start)
    // .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
  }
}