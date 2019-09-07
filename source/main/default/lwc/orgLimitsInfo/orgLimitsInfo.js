import { LightningElement, track, wire } from 'lwc';
import getLimits from '@salesforce/apexContinuation/SalesforceAPI.getLimits';
export default class ApiTest extends LightningElement {
    @track FileStorageMax;
    @track FileStorageRemaining;
    @track Data;
    @track Error;
    @wire(getLimits)
    limits({ error, data }){
        this.Data = data;
        this.Error = error;
        if (data) {
            this.FileStorageMax = data.FileStorageMB.Max;
            this.FileStorageRemaining = dataFileStorageMB.Remaining;
        }
    }
}