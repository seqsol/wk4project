library(shiny)
library(Biostrings)

na <- reactive({
    d <- gsub(" |\n", "", input$na2)
    na2 <- BString(toupper(d))
    if(identical(uniqueLetters(na2), c("A", "C", "G", "T"))){
        DNAString(na2)
    } else if(identical(uniqueLetters(na2), c("A", "C", "G", "U"))) {
        RNAString(na2)
    }else{
        print("The sequence contains bases other than 'A', 'C', 'G', 'T'") 
    }
})
output$len <- renderText({
    if(!is.null((input$todo)) & input$todo[1] == "Length"){
        paste(length(na()), "nucleotides")
    }
})

output$comp <- renderPlot({
    ul <- uniqueLetters(na())
    fre <- letterFrequency(na(), ul)
    prop <- fre/sum(fre)
    barplot(prop, xlab="Nucleotides", ylab="Proportion", col="skyblue")
}, width=400, height=300)

output$compl <- renderText({
    if("Complementary sequence" %in% input$todo){
        compl.seq <- complement(na())
        toString(compl.seq)
    }        
})
output$tr <- renderText({
    if("Amino acid sequence" %in% input$todo){
        aa <- translate(na())
        toString(aa) # translate all ORFs in the sequence
    }         
})


