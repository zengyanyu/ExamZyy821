export interface MessageResponse {
  /** 状态编码：200-成功，非200 -> 失败 */
  code: number;
  data: MessageData;

  /** 提示消息 */
  msg: string;
  items: []
}

export interface MessageData {
  /** 总条目数 */
  counts: number;
  items: MessageDataItem[];

  /** 页码 */
  page: number;

  /** 总页数 */
  pages: number;

  /** 页尺寸 */
  pageSize: number;
}

/** 数据列表 */
export interface MessageDataItem {
  /** 1：用户端，2：司机端，3：快递员端，4：后台管理系统 */
  bussinessType: number;

  /** 消息内容 */
  content: string;

  /** 消息类型，300：快递员端公告，301：寄件相关消息，302：签收相关消息，303：快件取消消息，200：司机端公告，201：司机端系统通知 */
  contentType: number;

  /** 创建时间 */
  created: string;

  /** 创建者 */
  createUser: number;

  /** 主键 */
  id: number;

  /** 消息是否已读，0：未读，1：已读 */
  isRead: number;

  /** 读时间 */
  readTime: string;

  /** 相关id */
  relevantId: number;

  /** 消息标题 */
  title: string;

  /** 更新时间 */
  updated: string;

  /** 更新者 */
  updateUser: number;

  /** 消息接受者 */
  userId: number;
}

export class MessageResponseModel implements MessageResponse {
  code: number = 0
  data: MessageData = new MessageDataModel({} as MessageData)
  msg: string = ''
  items: [] = []

  constructor(model: MessageResponse) {
    this.code = model.code
    this.data = model.data
    this.msg = model.msg
    this.items = model.items
  }
}

export class MessageDataModel implements MessageData {
  counts: number = 0
  items: MessageDataItem[] = []
  page: number = 0
  pages: number = 0
  pageSize: number = 0

  constructor(model: MessageData) {
    this.counts = model.counts
    this.items = model.items
    this.page = model.page
    this.pages = model.pages
    this.pageSize = model.pageSize
  }
}

export class MessageDataItemModel implements MessageDataItem {
  bussinessType: number = 0
  content: string = ''
  contentType: number = 0
  created: string = ''
  createUser: number = 0
  id: number = 0
  isRead: number = 0
  readTime: string = ''
  relevantId: number = 0
  title: string = ''
  updated: string = ''
  updateUser: number = 0
  userId: number = 0

  constructor(model: MessageDataItem) {
    this.bussinessType = model.bussinessType
    this.content = model.content
    this.contentType = model.contentType
    this.created = model.created
    this.createUser = model.createUser
    this.id = model.id
    this.isRead = model.isRead
    this.readTime = model.readTime
    this.relevantId = model.relevantId
    this.title = model.title
    this.updated = model.updated
    this.updateUser = model.updateUser
    this.userId = model.userId
  }
}
