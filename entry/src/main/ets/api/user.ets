// 登录接口
import { Request } from '../utils'
import { LoginFormModel, UserInfoModel } from '../viewmodels'

export const login = (data: LoginFormModel) => {
  return Request.post<string>("/login/account", data)
}

// 获取用户信息
export const getUserInfoAPI = () => {
  return Request.get<UserInfoModel>("/users")
}



