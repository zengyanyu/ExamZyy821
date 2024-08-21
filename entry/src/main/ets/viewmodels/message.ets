export interface MessageQueryParamModel {
  /** 消息类型，200：司机端公告，201：司机端系统通知 */
  contentType: number;
  page: number;
  pageSize: number;

}

export class MessageQueryParamModelModel implements MessageQueryParamModel {
  contentType: number = 0
  page: number = 0
  pageSize: number = 0

  constructor(model: MessageQueryParamModel) {
    this.contentType = model.contentType
    this.page = model.page
    this.pageSize = model.pageSize
  }
}
