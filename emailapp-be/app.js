

const Huncwot = require('huncwot');
const { ok } = require('huncwot/response');

const contacts = require('./contacts.json');

const app = new Huncwot();
 
 
app.get('/', (_) => 'Flutter in Practice') ;
app.get('/contacts', ({ params }) =>{ 
    const { q } = params;

    let r = contacts;

    console.log(`backend hit with: ${q}`);
    if(q){
        r = contacts.filter(({name}) => name.match(req.query));
    }
   return  ok(r);
});

app.listen(5544, () => console.log("Server running..."));