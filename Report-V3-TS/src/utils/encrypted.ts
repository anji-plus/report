import { md5 } from 'js-md5';
/**
 * 密码加盐后MD5
 * @param {HTMLElement} elm
 *
 */
export function transPsw(val) {
  return md5(val + 'gaea');
}
