(********************************************************************************)
(*	Lambdoc_write_html5.ml
	Copyright (c) 2009-2014 Dario Teixeira (dario.teixeira@yahoo.com)
	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

include Lambdoc_write_html5_impl.Main

module Make_simple = Lambdoc_write_html5_impl.Main.Make (Lambdoc_writer.Extension.Unit)

