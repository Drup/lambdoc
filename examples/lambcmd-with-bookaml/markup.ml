(********************************************************************************)
(*	Markup.ml
	Copyright (c) 2009-2014 Dario Teixeira (dario.teixeira@yahoo.com)
	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

(********************************************************************************)
(**	{1 Type definitions}							*)
(********************************************************************************)

type input_t = [ `Lambtex | `Lambwiki | `Lambxml | `Markdown | `Sexp ]

type output_t = [ `Sexp | `Html5 ]


(********************************************************************************)
(**	{1 Functions and values}						*)
(********************************************************************************)

let input_of_string x = match String.lowercase x with
	| "lambtex"  -> `Lambtex
	| "lambwiki" -> `Lambwiki
	| "lambxml"  -> `Lambxml
	| "markdown" -> `Markdown
	| "sexp"     -> `Sexp
	| _	     -> invalid_arg ("Markup.input_of_string: " ^ x)

let output_of_string x = match String.lowercase x with
	| "sexp" -> `Sexp
	| "html" -> `Html5
	| x	 -> invalid_arg ("Markup.output_of_string: " ^ x)

let to_string = function
	| `Lambtex  -> "Lambtex"
	| `Lambwiki -> "Lambwiki"
	| `Lambxml  -> "Lambxml"
	| `Markdown -> "Markdown"
	| `Sexp     -> "Sexp"
	| `Html5    -> "Html5"

let default_input = `Lambtex

let default_output = `Html5

