---
title       : Week 4 Shiny Project
subtitle    : A small DNA/RNA sequence analysis tool
author      : Xiaolong He
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap, shiny, interactive]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## Introduction

This shiny application accepts DNA or RNA sequence as the input and performs following analysis

1. Find the length of the sequence
2. Calculate the proportion of each base in the sequence
3. Find the complementary sequence
4. Find the amino acid sequence encoded by the sequence

--- 

## Input

Following are the examples of input sequences
<p style="text-align: justify; word-break: break-all; font-size: 50%;">
DNA: <br/>
TCTAACAAGAAGGACATTGATGACAACAGCAATGGAACCTATGAGAAAATGCAAAACTCAGCACCACGAAAACAAAGAGGACAGAGAAAAGAACGATCTCCTCAGCAGAATATAGTATCTTGTGTAAGTGTAAGCACCCAGACAGCTTCAGATGATCAAGCTGGTAAACTGTGGGATGAACTCAGTCTGGTTGGGCTTCCAGATGCCATTGATATCCAAGCCTTATTTGATTCTACAGGCACTTGTTGGGCTCATCACCGTTGTGTGGAGTGGTCACTAGGAGTATGCCAGATGGAAGAACCATTGTTAGTGAACGTGGACAAAGCTGTTGTCTCAGGGAGCACAGAACGATGTGCATTT
 <br/> <br/>
RNA: <br/>
AGGCAGAACGGUCGCCGCGUCGCCUCAGCACGGACCUCCAGGGAGCUCCUCAGCAAGAUCCUGCCAGGGCGCCCCUCAGCGCGAUUCUGCCGGGGUGCCUCUCAGCGUGGUCCUCCCCGGGGCUCCUCAGCACGAUUCUCCCGGUGCGCCCCUCAGCGCGGUCCUCCUCGGUGCGUCAGUCAUCGUGGUUCUCCCCGGCGCGCCCCUCGGCGCGGUUCUCCUCGGGGCUCCUCAGCGCGGCGCUCUUCUGGGGGCUCCUCGGCGCAGUUCUCCCCGGGGACUCCUCGGCGCCGUUCUCCUCGGGGCACCCGGGGCUUUUCGGCGCGGUUCUCCCCGGGGGUUCUUCGGCGCGGUUGUCCC
</p>

---

## User Interface

<div class="row-fluid">
  <h2>
    <h3>Sequence Analysis Tool</h3>
  </h2>
  <div class="col-sm-4">
    <form class="well span4">
      <div class="form-group shiny-input-container">
        <label for="na1">Please input your DNA Sequence below:</label>
        <textarea id="na1" class="form-control" placeholder="DNA Sequence..." style="width: 100%;  resize: vertical;" rows="10"></textarea>
      </div>
      <div id="todo1" style="width: 100%;" class="form-group shiny-input-checkboxgroup shiny-input-container">
        <label class="control-label" for="todo1">Check what you want to run:</label>
        <div class="shiny-options-group">
          <div class="checkbox">
            <label>
              <input type="checkbox" name="todo1" value="Length"/>
              <span>Length</span>
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" name="todo1" value="Nucleotide composition"/>
              <span>Nucleotide composition</span>
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" name="todo1" value="Complementary sequence"/>
              <span>Complementary sequence</span>
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" name="todo1" value="Amino acid sequence"/>
              <span>Amino acid sequence</span>
            </label>
          </div>
        </div>
      </div>
    </form>
  </div>
  <div class="col-sm-8"></div>
</div>

---

## Functional Shiny Application
You can test the application with the sequence in the text box or your own DNA or RNA sequence
<div class="row-fluid">
  <h2>
    <h3>Sequence Analysis Tool</h3>
  </h2>
  <div class="col-sm-4">
    <form class="well span4">
      <div class="form-group shiny-input-container">
        <label for="na2">Please input your DNA Sequence below:</label>
        <textarea id="na2" class="form-control" style="width: 100%;  resize: vertical;" rows="10">AATAAACTAGTTGAGAAGCAGAACCCAGCTGAAGGACTGCAAACTTTGGGGGCTCAAATGCAAGGTGGTTTTGGAT</textarea>
      </div>
      <div id="todo" style="width: 100%;" class="form-group shiny-input-checkboxgroup shiny-input-container">
        <label class="control-label" for="todo">Check what you want to run:</label>
        <div class="shiny-options-group">
          <div class="checkbox">
            <label>
              <input type="checkbox" name="todo" value="Length"/>
              <span>Length</span>
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" name="todo" value="Nucleotide composition"/>
              <span>Nucleotide composition</span>
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" name="todo" value="Complementary sequence"/>
              <span>Complementary sequence</span>
            </label>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" name="todo" value="Amino acid sequence"/>
              <span>Amino acid sequence</span>
            </label>
          </div>
        </div>
      </div>
    </form>
  </div>
  <div class="col-sm-8">
    <div data-display-if="input.todo.indexOf(&#39;Length&#39;) != -1" data-ns-prefix="">
      <h4>
        <strong>Length of the sequence</strong>
      </h4>
      <h4>
        <div id="len" class="shiny-text-output"></div>
      </h4>
    </div>
    <div data-display-if="input.todo.indexOf(&#39;Nucleotide composition&#39;) != -1" data-ns-prefix="">
      <h4>
        <strong>Proportion of each base in the sequence</strong>
      </h4>
      <div id="comp" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
    </div>
    <div data-display-if="input.todo.indexOf(&#39;Complementary sequence&#39;) != -1" data-ns-prefix="">
      <h4>
        <strong>Complementary sequence of the DNA</strong>
      </h4>
      <p>
        <div id="compl" class="shiny-text-output"></div>
      </p>
    </div>
    <div data-display-if="input.todo.indexOf(&#39;Amino acid sequence&#39;) != -1" data-ns-prefix="">
      <h4>
        <strong>Open reading frames encoded by the sequence</strong>
      </h4>
      <p>
        <div id="tr" class="shiny-text-output"></div>
      </p>
    </div>
  </div>
</div>
