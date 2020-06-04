from flask import  Flask,render_template,request
import sqlite3

app = Flask(__name__)
conn = sqlite3.connect("stock_trade.db",check_same_thread = False)

@app.route('/trade')
def trade():
    return render_template("trade.html")

@app.route('/show',methods=['POST'])

def show():
    form_data = []
    stock_code = request.form.get("stock_code")
    print(stock_code)
    form_data.append(stock_code)

    print("********************")

    print("********************")
    result = request.form
    cousor = conn.cursor()
    sql = '''
    insert into stock_trade_deatail (stock_code)
    values ('{}')
    '''
    cousor.execute(sql.format(stock_code))
    conn.commit()
    conn.close()

    return render_template("show.html",result=result)

if __name__ == '__main__':
    app.run(debug=True)