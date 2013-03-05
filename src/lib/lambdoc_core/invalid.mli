(********************************************************************************)
(*	Invalid.mli
	Copyright (c) 2009-2010 Dario Teixeira (dario.teixeira@yahoo.com)
	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

(**	Definitions concerning invalid documents.
*)

open Prelude


(********************************************************************************)
(**	{1 Type definitions}							*)
(********************************************************************************)

type t = Error.t nelist with sexp


(********************************************************************************)
(**	{1 Functions and values}						*)
(********************************************************************************)

(********************************************************************************)
(**	{2 Constructors}							*)
(********************************************************************************)

val make: Error.t nelist -> t


(********************************************************************************)
(**	{2 Serialisation facilities}						*)
(********************************************************************************)

val serialize: t -> string
val deserialize: string -> t

