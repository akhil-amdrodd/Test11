import { LightningElement, wire, api, track } from 'lwc';
import getRecord  from  '@salesforce/apex/GoogleMapMultipleObject.getRecord';  

export default class GoogleMapMultipleObject extends LightningElement {
    @api recordId;
@track mapMarkers;

@wire(getRecord,{recrId:'$recordId'})
wiregetRecord({data, error}){

    if (data) {
        this.mapMarkers = data;
        console.log('Success'+data);
        console.log(JSON.stringify(data, null, '\t'));
    } else if (error) {
        console.error(error);
    }
}


}