(********************************************************************************)
(*	Note.mli
	Copyright (c) 2009-2014 Dario Teixeira (dario.teixeira@yahoo.com)
	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

(**	Definitions concerning note blocks.
*)


(********************************************************************************)
(**	{1 Type definitions}							*)
(********************************************************************************)

type order_t = (Order.ordinal_t, Order.ordinal_t Order.auto_given_t) Order.t with sexp

type t =
	{
	label: Label.t;
	order: order_t;
	content: Block.frag_t;
	} with sexp


(********************************************************************************)
(**	{1 Public functions and values}						*)
(********************************************************************************)

val make: Label.t -> order_t -> Block.frag_t -> t

