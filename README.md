# sqlTinj
<b>Automation: Bash script wrapper to find and verify time base sql injection </b>

## Getting started
<b>Usage:</b>

<b><b>Syntax</b></b>:</b></b>

<b>sqlTinj -l "urllist"  -z  "zerosecdelay" -f  "fivesecdelay" -t  "tensecdelay" -a  "useragent"</b></b></b>  
                                                                                                                                                                         

![image](https://user-images.githubusercontent.com/76627210/185179723-79c30e30-8742-4383-8efb-21a0da17a56d.png)

                                                                                                                              
<b>options</b>: 
  
      l List of urls file.  
  
      z Time based sql injection payload with zero sec delay. 
  
      f Time based sql injection payload with five sec delay.
  
      t Time based sql injection payload with ten sec delay.
  
      a Customer User Agent.
  
      h For HELP   

<b>Example:</b></b></b></b>

<b> sqlTinj -l urls.txt -z "sleep(0)#" -f "sleep(5)#" -t "sleep(10)#"  -a "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0" </b>
  
 OR

<b> ./sqlTinj.sh -l urls.txt -z "sleep(0)#" -f "sleep(5)#" -t "sleep(10)#"  -a "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0" </b>

![image](https://user-images.githubusercontent.com/76627210/185210177-67001d9c-1df0-408f-a145-5b6a9af8e191.png)


Note: This only for educational suppose and for Pentester and bugbounty hunting  
