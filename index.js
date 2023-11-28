const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const usersController = require('./controllers/usersController');
const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.json({type: ['application/json', 'text/plain']}));
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'views')));





//ROUTES

app.get('/', (req, res) => {
    console.log('coucou');
    
});

app.post('/signup', usersController.signup);

/* app.get('/spécialistes/:id', async (req,res) => {
    const id = req.params.id

    const result = await db.query(`SELECT  questions.content FROM questions
                                      WHERE id = $1`, [id]);

});*/

/* app.get('/diary/edit/:id', (req, res) => {
    Diary.findOne({
        _id: req.params.id
    }).then((data) => {
        res.render('Edit', { data: data });
    }).catch(err => console.log(err));
})*/






/*app.delete('/diary/delete/:id', (req, res) => {
    Diary.remove({
        _id: req.params.id
    }).then(() => {
        res.redirect('/diary');
    }).catch(err => console.log(err));
})*/

/*app.post('/add-to-diary', (req, res) => {
    const Data = new Diary({
        title: req.body.title,
        description: req.body.description,
        date: req.body.date
    })*/

    

app.listen(port, () => console.log("Server Started Running"));