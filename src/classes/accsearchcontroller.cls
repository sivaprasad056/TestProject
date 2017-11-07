public with sharing class accsearchcontroller {
 public list <account> acc{get;set;}  
   public string searchstring {get;set;} 
   Public string selectoptions{get;set;} 
   public string accid{get;set;}
   
   public PageReference deleteacc(){
       Account acc = new Account(id=accid);
       Delete acc;
       PageReference ref = new PageReference('/apex/AccountSearch');
       ref.setredirect(true);
       return ref;
   }

    public accsearchcontroller(ApexPages.StandardController controller) {

    }
     public Void search(){ 
     if(selectoptions=='Contains') {
     string searchquery='select name,id from account where name Like\'%'+searchstring+'%\' Limit 20'; 
     acc= Database.query(searchquery);
      
     }
     else if(selectoptions=='Startwith'){
     string searchquery='select name,id from account where name Like\''+searchstring+'%\' Limit 20'; 
     acc= Database.query(searchquery);
     
         }
      else if(selectoptions=='Like'){
     string searchquery='select name,id from account where name Like\'%'+searchstring+'%\' Limit 20'; 
     acc= Database.query(searchquery);
     
    
         }
        
         
       
   }  
   public void clear(){  
   acc.clear();
   searchstring=null;
   }

}