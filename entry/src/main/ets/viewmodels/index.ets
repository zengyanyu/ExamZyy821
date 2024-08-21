export * from './tabs'

export * from './message'

export * from './user'

export * from './message_response'

// 泛型工具
export class ResponseData<T> {
  code: number = 0
  msg: string = ""
  data: T | null = null
  // data?: T
}

export class RespData {
  code: number = 0
  msg: string = ""
}