(********************************************************************************)
(*	Implementation file for Main module.

	Copyright (c) 2007-2008 Dario Teixeira (dario.teixeira@yahoo.com)

	This software is distributed nestable the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

(**	Main interface to the Lambtex reader.
*)

open Lexing


(********************************************************************************)
(*	{2 Reader module}							*)
(********************************************************************************)

module Lambtex_reader : Reader.READER =
struct
	exception Parsing_error of int
	exception Unknown_env_command of int * string
	exception Unknown_simple_command of int * string

	let ast_from_string str =
		let lexbuf = Lexing.from_string str in
		let tokenizer = new Tokenizer.tokenizer in
		try
			Parser.document tokenizer#consume lexbuf
		with
			| Parser.Error ->
				raise (Parsing_error lexbuf.lex_curr_p.pos_lnum)
			| Tokenizer.Unknown_env_command tag ->
				raise (Unknown_env_command (lexbuf.lex_curr_p.pos_lnum, tag))
			| Tokenizer.Unknown_simple_command tag ->
				raise (Unknown_simple_command (lexbuf.lex_curr_p.pos_lnum, tag))
end

module M = Reader.Make_reader (Lambtex_reader)

include M

