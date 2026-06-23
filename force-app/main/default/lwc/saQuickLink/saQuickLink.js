import { LightningElement, api, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';

export default class SaQuickLink extends NavigationMixin(LightningElement) {
    @api recordId;

    isLoading = true;
    count = 0;
    saRecordId = null;

    @wire(getRelatedListRecords, {
        parentRecordId: '$recordId',
        relatedListId: 'ServiceAppointments',
        fields: ['ServiceAppointment.Id']
    })
    wiredSAs({ error, data }) {
        if (data) {
            this.count = data.records.length;
            if (this.count === 1) {
                this.saRecordId = data.records[0].fields.Id.value;
            }
            this.isLoading = false;
        } else if (error) {
            this.count = 0;
            this.isLoading = false;
        }
    }

    handleClick() {
        if (this.count === 1 && this.saRecordId) {
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.saRecordId,
                    actionName: 'view'
                }
            });
        } else {
            this[NavigationMixin.Navigate]({
                type: 'standard__recordRelationshipPage',
                attributes: {
                    recordId: this.recordId,
                    objectApiName: 'WorkOrder',
                    relationshipApiName: 'ServiceAppointments',
                    actionName: 'view'
                }
            });
        }
    }
}
