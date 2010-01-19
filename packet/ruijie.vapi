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

	
	public static delegate int authprogress ( int reason,[CCode(array_length = false, array_nullterminated = false)] string  current_packet ,void * userptr );
	public int start_auth(
			[CCode(array_length = false, array_nullterminated = false)]
			char[]  name,
			[CCode(array_length = false, array_nullterminated = false)]
			char[] passwd,
			[CCode(array_length = false, array_nullterminated = false)]
			char[] nic_name,
			//
			int auth_mode,
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
