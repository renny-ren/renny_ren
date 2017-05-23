function modify_tag(obj){
  var new_tag = obj.innerHTML;
  var selected_tags = document.getElementById('article_tag').value

  if(selected_tags.indexOf(new_tag) > 0){
    selected_tags = selected_tags.replace('^^' + new_tag, '');
    obj.className = "tag";
  }
  else{
    selected_tags += "^^" + obj.innerHTML;
    obj.className = "selected_tag"; 
  }  
}