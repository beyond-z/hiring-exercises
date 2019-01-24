# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load",  ->
  enableFellowTagChecklistToggle = (element, listUrl, placeholder) ->
    if $("#fellow_#{element}_tags").length
      $.get listUrl, (data) ->
        $("#fellow_#{element}_tags").show();
      
        $("#fellow_#{element}_tags").tagsInput
          autocomplete: {source: data}
          placeholder: placeholder
          delimiter: ";"
          validationPattern: new RegExp('^(' + data.join('|') + ')$')

        $("a##{element}-full-list").click (event) ->
          event.preventDefault()
        
          tags = $("#fellow_#{element}_tags").val().split(";")

          $(".#{element}_checkbox").each (index) ->
            if tags.includes($(this).next('label').text())
              $(this).prop("checked", true)
            else
              $(this).prop("checked", false)
      
          $("##{element}-checklist").show()
          $("##{element}-tags").hide()
    
        $("a##{element}-short-list").click (event) ->
          event.preventDefault()

          tags = []
        
          $(".#{element}_checkbox").each (index) ->
            if $(this).prop("checked")
              tags.push($(this).next('label').text())
        
          $("#fellow_#{element}_tags").importTags(tags.join(';'))
        
          $("##{element}-checklist").hide()
          $("##{element}-tags").show()

  preventPartialTags = () ->
    $('form').submit (event) ->
      $('.jquery-tags input').each ->
        if $(this).val().length > 0
          event.preventDefault()
          
          leftover = $(this).val()
          label = $(this).parents('.jquery-tags').prevAll('h3').text()
          
          alert("Please complete or remove your search for \"#{leftover}\" in \"#{label}\"")
          setTimeout(reenableSubmit, 1000)
  
  reenableSubmit = () ->
    $('form input[type="submit"]').removeAttr('disabled', 'false')
    
  loadResumes = () ->
    $('.fellow-resume-url').each ->
      resume = $(this)
      id = resume.data('fellow')
      
      $.get "/admin/fellows/#{id}/resumes.json", (data) ->
        resumes = data['resumes']
        
        if resumes.length  == 0
          resume.html('')
        else
          linker = (attachment) -> "<a href=\"#{attachment['url']}\" target=\"_blank\">#{attachment['name']}</a>"
          links = (linker attachment for attachment in resumes)
          
          resume.html(links.join(', '))
          resume.removeClass('faded')
      .fail ->
        resume.html('')
          
  enableFellowTagChecklistToggle("interest", '/admin/interests/list.json', 'Add an Interest')
  enableFellowTagChecklistToggle("industry", '/admin/industries/list.json', 'Add an Industry')
  enableFellowTagChecklistToggle("major",    '/admin/majors/list.json', 'Add a Major')
  enableFellowTagChecklistToggle("metro",    '/admin/metros/list.json', 'Add a Location')

  preventPartialTags()
  loadResumes()