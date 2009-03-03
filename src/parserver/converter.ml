(********************************************************************************)
(*	Implementation file for Converter module.

	Copyright (c) 2009 Dario Teixeira (dario.teixeira@yahoo.com)

	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

open Lambdoc_proxy


(********************************************************************************)
(********************************************************************************)

class processor : Netplex_types.processor =

	let empty_hooks = new Netplex_kit.empty_processor_hooks () in

object (self)

	inherit Netplex_kit.processor_base empty_hooks

	method process ~when_done container fd proto_name =
		let in_channel = Unix.in_channel_of_descr fd
		and out_channel = Unix.out_channel_of_descr fd in
		Unix.clear_nonblock fd;
		let request : Protocol.request_t = Marshal.from_channel in_channel in
		let () = match request with
			| Protocol.Manuscript_from_lambtex source ->
				let manuscript = Read_lambtex.Main.ambivalent_manuscript_from_string source
				in Marshal.to_channel out_channel manuscript []
			| Protocol.Composition_from_lambtex source ->
				let composition = Read_lambtex.Main.ambivalent_composition_from_string source
				in Marshal.to_channel out_channel composition [] in
		let () = close_out out_channel
		in when_done ()

	method supported_ptypes = [ `Multi_processing; `Multi_threading ]
end


(********************************************************************************)
(********************************************************************************)

class processor_factory : Netplex_types.processor_factory =
object (self)
	method name = "converter"
	method create_processor ctrl_cfg cfg_file cfg_addr = new processor
end

