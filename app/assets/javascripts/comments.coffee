$(document).on "page:change", ->
	$("#comment-link").click (event) ->
		event.preventDefault()
		$("#comment-form").slideDown("slow")
		$("#comment_content").focus()