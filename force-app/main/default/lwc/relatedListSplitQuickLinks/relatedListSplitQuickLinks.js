import { LightningElement, api, wire } from 'lwc';
import getRelatedListLinks from '@salesforce/apex/RelatedListSplitQuickLinksController.getRelatedListLinks';

export default class RelatedListSplitQuickLinks extends LightningElement {
    @api recordId;
    @api objectApiName;
    @api relationshipNames;

    relatedWithData = [];
    relatedWithoutData = [];
    errorMessage;

    @wire(getRelatedListLinks, { recordId: '$recordId', relationshipNamesCsv: '$relationshipNames' })
    wiredRelatedLinks({ error, data }) {
        if (data) {
            this.relatedWithData = data.withData || [];
            this.relatedWithoutData = data.withoutData || [];
            this.errorMessage = null;
        } else if (error) {
            this.relatedWithData = [];
            this.relatedWithoutData = [];
            this.errorMessage = 'Unable to load related lists.';
            // Keep details in console for troubleshooting while UI stays clean.
            // eslint-disable-next-line no-console
            console.error(error);
        }
    }

    get hasWithData() {
        return this.relatedWithData.length > 0;
    }

    get hasWithoutData() {
        return this.relatedWithoutData.length > 0;
    }

    get showDivider() {
        return this.hasWithData && this.hasWithoutData;
    }
}
