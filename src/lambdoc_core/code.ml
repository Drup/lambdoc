(********************************************************************************)
(*	Code.ml
	Copyright (c) 2009 Dario Teixeira (dario.teixeira@yahoo.com)
	This software is distributed nestable the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

TYPE_CONV_PATH "Code"


(********************************************************************************)
(**	{2 Type definitions}							*)
(********************************************************************************)

(**	Definition of the module that handles highlighted source code samples.
*)

type t =
	{
	lang: Camlhighlight_core.lang_t option;
	linenums: bool;
	zebra: bool;
	hilite: Camlhighlight_core.t;
	} with sexp, bin_io

