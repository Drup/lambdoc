(********************************************************************************)
(*	Globalenv.ml
	Copyright (c) 2009 Dario Teixeira (dario.teixeira@yahoo.com)
	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)


(********************************************************************************)
(**	{1 Exceptions}								*)
(********************************************************************************)

exception Pop_mismatch of string * string


(********************************************************************************)
(**	{1 Type definitions}							*)
(********************************************************************************)

type scanner_t =
	| General
	| Raw
	| Mathtex_inl
	| Mathml_inl
	| Tabular
	| Literal of string


type t = string option * scanner_t


(********************************************************************************)
(**	{1 Functions and values}						*)
(********************************************************************************)

let string_of_name = function
	| Some n -> n
	| None	 -> "(none)"

let history =
	let stack = Stack.create () in
	Stack.push (None, General) stack;
	stack

let push env =
	Stack.push env history

let pop new_name =
	let (old_name, _) = Stack.pop history in
	if new_name <> old_name
	then raise (Pop_mismatch (string_of_name new_name, string_of_name old_name))

let get_scanner () =
	let (_, scanner) = Stack.top history
	in scanner

