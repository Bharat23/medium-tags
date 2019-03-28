install.packages('rvest');
install.packages('textcat');
require('rvest');
require('textcat');

data = read.csv('./Medium_Clean.csv');

contentList = vector();
 for (i in seq(1, 10)) {
   url = as.vector(data[i, 'url']);
   texts = tryCatch({
     webpage = read_html(url);
     pTags = html_nodes(webpage, 'p');
     pText = html_text(pTags);
     language = textcat::textcat(pText);
     if (language == 'english') {
       print('here')
        return(pText);
     } else {
       return('non-english');
     }
   }, error = function(error_condition) {
     print(error_condition)
     return('bad html')
   });
   contentList[i] = paste(texts, sep = " ", collapse = " ");
 }
length(contentList)


textcat::textcat(contentList[4])
contentList[5]
