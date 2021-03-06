(********************************************************************************)
(*	Custom.ml
	Copyright (c) 2009-2014 Dario Teixeira (dario.teixeira@yahoo.com)
	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

open Basic


(********************************************************************************)
(**	{1 Type definitions}							*)
(********************************************************************************)

type kind_t =
	| Boxout
	| Theorem
	with sexp

type key_t = Pointer.t with sexp

type order_t = (Order.ordinal_t, [ Order.ordinal_t Order.auto_given_t | Order.ordinal_t Order.user_given_t | Order.none_given_t ]) Order.t with sexp

type anonymous_t = [ `Anonymous of key_t * Label.t ] with sexp

type unnumbered_t = [ `Unnumbered of key_t * Label.t ] with sexp

type numbered_t = [ `Numbered of key_t * Label.t * (Order.ordinal_t, [ Order.ordinal_t Order.auto_given_t | Order.ordinal_t Order.user_given_t | Order.none_given_t ]) Order.t ] with sexp

type t = [ anonymous_t | unnumbered_t | numbered_t ]


(********************************************************************************)
(**	{1 Public functions and values}						*)
(********************************************************************************)

let anonymous key label = function
	| `None_given -> `Anonymous (key, label)
	| _	      -> invalid_arg "Custom.anonymous"

let unnumbered key label = function
	| `None_given -> `Unnumbered (key, label)
	| _	      -> invalid_arg "Custom.unnumbered"

let numbered key label order = `Numbered (key, label, order)


(********************************************************************************)
(**	{1 Public modules}							*)
(********************************************************************************)

module Boxout =
struct
	type t = [ anonymous_t | unnumbered_t | numbered_t ] with sexp

	let make x = x
end


module Theorem =
struct
	type t = [ unnumbered_t | numbered_t ] with sexp

	let make = function
		| `Anonymous _ -> invalid_arg "Custom.Theorem.make"
		| #unnumbered_t
		| #numbered_t as x -> x
end

