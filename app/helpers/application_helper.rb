module ApplicationHelper
	def default_text(text)  
		onFocusFunction = "field = event.target || event.srcElement; if (field.value=='#{text}') {field.value = '';}else {return false}"  
		onBlurFunction = "field = event.target || event.srcElement; if (field.value=='') {field.value = '#{text}';}else {return false}"  
		{:value => text, :onfocus => onFocusFunction, :onblur => onBlurFunction}   
	end  	
end
