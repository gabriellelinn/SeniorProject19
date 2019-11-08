//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TestProject
{
    using System;
    using System.Collections.Generic;
    
    public partial class userAccount
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public userAccount()
        {
            this.requests = new HashSet<request>();
        }
    
        public int ID { get; set; }
        public string last_name { get; set; }
        public string first_name { get; set; }
        public string email { get; set; }
        public string hashedPassword { get; set; }
        public System.DateTime dateCreated { get; set; }
        public int createdBy { get; set; }
        public Nullable<bool> accountStatus { get; set; }
        public Nullable<int> lunch { get; set; }
        public Nullable<int> fullDayHours { get; set; }
        public Nullable<int> emp_id { get; set; }
        public Nullable<int> userRole_id { get; set; }
        public Nullable<System.DateTime> lastUpdated { get; set; }
        public Nullable<int> supervisor { get; set; }
        public Nullable<int> usedVHours { get; set; }
        public Nullable<int> usedPHours { get; set; }
        public Nullable<int> vacation_carryOver { get; set; }
        public Nullable<int> personal_carryOver { get; set; }
    
        public virtual employee employee { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<request> requests { get; set; }
        public virtual userRole userRole { get; set; }
    }
}
