(********************************************************************************)
(**	Postprocessing on documents.

	Copyright (c) 2007-2008 Dario Teixeira (dario.teixeira@yahoo.com)

	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

open Document_ast
open Document_features
open Document_error
open Document_ambivalent


(********************************************************************************)
(*	{2 Public functions}							*)
(********************************************************************************)

val collate_errors:
	string ->
	(int * Error.error_msg_t) list ->
	Error.t list

val process_manuscript:
	?deny_list: Features.manuscript_feature_t list ->
	?accept_list: Features.manuscript_feature_t list ->
	?default: Features.default_t ->
	string ->
	Ast.t ->
	Ambivalent.manuscript_t

val process_composition:
	?deny_list: Features.composition_feature_t list ->
	?accept_list: Features.composition_feature_t list ->
	?default: Features.default_t ->
	string ->
	Ast.t ->
	Ambivalent.composition_t
