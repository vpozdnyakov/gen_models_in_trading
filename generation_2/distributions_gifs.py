import pandas as pd
import matplotlib.pyplot as plt
import imageio, os

returns_test = pd.read_csv('data/returns_test.csv', index_col=0)
returns_test['type'] = 'real'
gen_t_copula = pd.read_csv('data/gen_t_copula.csv', index_col=0)
gen_t_copula['type'] = 't_copula'
gen_t_copulaKDE = pd.read_csv('data/gen_t_copulaKDE.csv', index_col=0)
gen_t_copulaKDE['type'] = 't_copulaKDE'
gen_gbm = pd.read_csv('data/gen_gbm.csv', index_col=0)
gen_gbm['type'] = 'GBM'
gen_tgan = pd.read_csv('data/gen_tgan.csv', index_col=0)
gen_tgan['type'] = 'GBM'

step = 2000
for gen, model in [
    [gen_gbm, 'gen_gbm'], 
    [gen_t_copula, 'gen_t_copula'], 
    [gen_t_copulaKDE, 'gen_t_copulaKDE'], 
    [gen_tgan, 'gen_tgan'],
    ]:
    for i in range(0, 10000, step):
        plt.figure(figsize=(6, 6))
        plt.scatter(gen.natural[i:i+step], gen.gasoline[i:i+step], s=10)
        plt.scatter(returns_test.natural, returns_test.gasoline, s=10)
        plt.axis('equal')
        plt.xlim(-0.25, 0.25)
        plt.ylim(-0.25, 0.25)
        plt.savefig('figs/{}{}.png'.format(model, i))

for model in ['gen_gbm', 'gen_t_copula', 'gen_t_copulaKDE', 'gen_tgan']:
    with imageio.get_writer('gifs/{}.gif'.format(model), mode='I') as writer:
        for i in range(0, 10000, step):
            filename = 'figs/{}{}.png'.format(model, i)
            writer.append_data(imageio.imread(filename))
            writer.append_data(imageio.imread(filename))
            os.remove(filename)