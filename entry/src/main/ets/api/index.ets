// 分页查询消息列表
import { Request, RequestAxios } from '../utils'
import { MessageQueryParamModelModel, MessageResponseModel, RespData, ResponseData } from '../viewmodels'

export * from './user'

export const getDriverMessageAPI = (data: MessageQueryParamModelModel) => {
  return RequestAxios.get<MessageResponseModel>('/messages/page', data)
}

// 标位已读
export const getBakAPI = (id: number) => {
  return Request.put<RespData>(`/messages/${id}`)
}
