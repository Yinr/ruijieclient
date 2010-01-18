/*
 * ruijie.vapi
 *
 *  Created on: 2010-1-2
 *      Author: G.S.Alex < i AT gsalex.net > from HIT at Weihai *
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

/*
 *  READ supplicant.h for more information.
 */

[CCode(cheader_filename = "supplicant.h")]
namespace ruijie{

	enum auth_callback_reason
	{
		RUIJIE_AUTH_FINDSERVER = 1,
		RUIJIE_AUTH_NEEDNAME = 2,
		RUIJIE_AUTH_NEEDPASSWD = 3,
		RUIJIE_AUTH_SUCCESS = 0,
		RUIJIE_AUTH_FAILED = 4,
	};

	enum authmode
	{
		/*
	 	* dhcp 打开 (DHCP模式)
	 	*/
		RUIJIE_AUTHMODE_DHCP = 0x00000001,
		
		/*
		* 不使用本机获得的 ip 地址和其他信息 (进行dhcp认证的时候用)
	 	*/
		RUIJIE_AUTHMODE_NOIP = 0x00000002 ,

		/*
	 	* 不要初始化 计数 :) (dhcp二次认证的时候用到)
	 	*/
		RUIJIE_AUTHMODE_NOECHOKEY = 0x00000004 ,

		/*
		* 使用锐捷私有广播地址
		*/
		RUIJIE_AUTHMODE_PRIVATEBROADCAST =  0x00010000
	};
	
	public static delegate int authprogress ();
	public int start_auth(
			[CCode(array_length = false, array_nullterminated = false)]
			char[]  name,
			[CCode(array_length = false, array_nullterminated = false)]
			char[] passwd,
			[CCode(array_length = false, array_nullterminated = false)]
			char[] nic_name,
			//
			authmode the_authmode,
			authprogress auth_callback,
			void * userptr
			);
	public int stop_auth();
	public int get_server_msg( 
			[CCode(array_length = false, array_nullterminated = false)]
			char[]  raw_encode_message_out,//原始服务器输出,GBK编码
			int  length
			);
	public int echo();
}