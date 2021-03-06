(********************************************************************************)
(*	Explanations.mli
	Copyright (c) 2009-2014 Dario Teixeira (dario.teixeira#yahoo.com)
	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

(**	Explains errors.
*)


(********************************************************************************)
(**	{1 Public functions and values}						*)
(********************************************************************************)

val explain: Lambdoc_core.Error.error_msg_t -> Lambdoc_core.Inline.seq_t

