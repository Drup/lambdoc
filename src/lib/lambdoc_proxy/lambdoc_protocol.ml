(********************************************************************************)
(*	Lambdoc_protocol.ml
	Copyright (c) 2009-2010 Dario Teixeira (dario.teixeira@yahoo.com)
	This software is distributed under the terms of the GNU GPL version 2.
	See LICENSE file for full license text.
*)
(********************************************************************************)

open Lambdoc_core


(********************************************************************************)
(*	{1 Type definitions}							*)
(********************************************************************************)

type payload_t =
	{
	verify_utf8: bool option;
	expand_entities: bool option;
	feature_ruleset: Features.feature_ruleset_t;
	feature_default: Features.action_t;
	classname_ruleset: Features.classname_ruleset_t;
	classname_default: Features.action_t;
	markup: Markup.t;
	source: string;
	}

type request_t = Request_document of payload_t

type reply_t = Reply_document of Ambivalent.t

