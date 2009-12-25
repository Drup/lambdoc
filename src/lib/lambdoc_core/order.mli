(********************************************************************************)
(*	Order.mli
	Copyright (c) 2009 Dario Teixeira (dario.teixeira@yahoo.com)
	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

(**	Definitions pertaining to document ordering.
*)

open Basic


(********************************************************************************)
(**	{1 Exceptions}								*)
(********************************************************************************)

exception Invalid_order_format of string
exception Invalid_order_levels of string * hierarchical_level_t * int


(********************************************************************************)
(**	{1 Type definitions}							*)
(********************************************************************************)

type ordinal_t = int with sexp

type ordinal_counter_t

type ordinal_converter_t = (ordinal_t -> string)

type hierarchical_t = 
	| Level1_order of int
	| Level2_order of int * int
	| Level3_order of int * int * int
	with sexp

type hierarchical_counter_t

type hierarchical_converter_t =
	{
	level1: (int -> string);
	level2: (int -> string);
	level3: (int -> string);
	}

type 'a auto_given_t = [ `Auto_given of 'a ] with sexp_poly
type 'a user_given_t = [ `User_given of 'a ] with sexp_poly
type none_given_t = [ `None_given ] with sexp_poly
type ('a, 'b) t = 'b constraint 'b = [< 'a auto_given_t | 'a user_given_t | none_given_t ] with sexp_poly


(********************************************************************************)
(**	{1 Functions and values}						*)
(********************************************************************************)

(********************************************************************************)
(**	{2 Creation of counters}						*)
(********************************************************************************)

val make_ordinal_counter: unit -> ordinal_counter_t ref
val make_hierarchy_counter: unit -> hierarchical_counter_t ref


(********************************************************************************)
(**	{2 Constructors}							*)
(********************************************************************************)

val auto_ordinal: ordinal_counter_t ref -> [> `Auto_given of ordinal_t ]
val auto_hierarchical: hierarchical_level_t -> hierarchical_counter_t ref -> [> `Auto_given of hierarchical_t ]
val user_ordinal: string -> [> `User_given of ordinal_t ]
val user_hierarchical: hierarchical_level_t -> string -> [> `User_given of hierarchical_t ]
val none: unit -> [> `None_given ]


(********************************************************************************)
(**	{2 Printers}								*)
(********************************************************************************)

val maybe_string_of_ordinal: ordinal_converter_t -> (ordinal_t, 'b) t -> string option
val maybe_string_of_hierarchical: hierarchical_converter_t -> (hierarchical_t, 'b) t -> string option

