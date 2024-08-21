// 分页查询消息列表
import { RequestAxios } from '../utils'
import { MessageQueryParamModelModel } from '../viewmodels'

export const getDriverMessageAPI = (data: MessageQueryParamModelModel) => {
  return RequestAxios.get<MessageQueryParamModelModel>('/messages/page', data)
}
