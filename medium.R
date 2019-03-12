install.packages('rvest');
require('rvest');

data = read.csv('./Medium_Clean.csv');

contentList = vector();
 for (i in seq(1, nrow(data))) {
   url = as.vector(data[i, 'url']);
   texts = tryCatch({
     webpage = read_html(url);
     pTags = html_nodes(webpage, 'p');
     pText = html_text(pTags);
     pText;
   }, error = function(error_condition) {
     return('bad html')
   });
   contentList[i] = paste(texts, sep = " ", collapse = " ");
 }
length(contentList)
 

