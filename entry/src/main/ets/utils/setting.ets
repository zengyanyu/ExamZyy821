import { preferences } from '@kit.ArkData'
import { TOKEN_KEY, USER_SETTING, USER_SETTING_AD } from '../constants'

export class UserSettingClass {
  // 首选项的读取和设置
  context?: Context // 上下文的属性
  constructor(ctx: Context) {
    this.context = ctx
  }

  // 获取仓库
  getStore() {
    return preferences.getPreferencesSync(this.context!, {
      name: USER_SETTING
    })
  }

  getToken() {
    const store = this.getStore()
    return store.getSync(TOKEN_KEY, '') as string
  }

  async setToken(token: string) {
    const store = this.getStore()
    store.putSync(TOKEN_KEY, token)
    // 刷新
    await store.flush();
  }
}
