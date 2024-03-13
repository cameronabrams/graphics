import matplotlib.pyplot as plt
import matplotlib.cm as cm
import numpy as np
# import pandas as pd
import yaml

def get_text_loc(x,y,o,fac=2):
    xf=1.0
    yf=1.0
    if len(o)==1:
        if o=='n':
            yf=fac
        elif o=='s':
            yf=1.0/fac
        elif o=='e':
            xf=fac
        elif o=='w':
            xf=1.0/fac
    else:
        v=o[0]
        h=o[1]
        xf=fac if h=='e' else 1.0/fac
        yf=fac if v=='n' else 1.0/fac
    return xf*x,yf*y

# data=pd.read_csv('time_vs_length.dat',sep='\s+',header=0,index_col=None)
# print(data)
with open('time_vs_length_input.yaml','r') as f:
    data=yaml.safe_load(f)

fig,ax=plt.subplots(1,1,figsize=data['defaults']['figure']['size'])
rotation=np.degrees(np.arctan2(data['defaults']['figure']['size'][1],data['defaults']['figure']['size'][0]))
ax.set_xlim([1e-16,1e22])
ax.set_xscale('log')
ax.set_ylim([1e-16,1e22])
ax.set_yscale('log')
ax.set_xlabel('length (m)')
ax.set_ylabel('time (s)')
ax.set_xticks(np.logspace(-15,21,13))
ax.set_yticks(np.logspace(-15,21,13))
ax.spines[['right', 'top']].set_visible(False)

for point in data['points']:
    x=float(point['length'])
    y=float(point['time'])
    l=point['name']
    o=point.get('offset',data['defaults']['points']['offset'])
    print(x,y,l,o)
    xt,yt=get_text_loc(x,y,o,fac=point.get('offset_fac',data['defaults']['points']['offset_fac']))
    ax.plot(x,y,marker='o',color='#07294D')
    t=ax.text(xt,yt,l,fontsize=12,horizontalalignment=point.get('horizontalalignment',data['defaults']['points']['horizontalalignment']),verticalalignment=point.get('verticalalignment',data['defaults']['points']['verticalalignment']))
    t.set_bbox(dict(boxstyle='round,pad=0.1',facecolor='#FFC903', alpha=0.5, linewidth=0))

xd=np.logspace(-16,22,10)
d=data['defaults']['velocities']
for v in data['velocities']:
    if v.get('include',True):
        yd=xd/float(v['value'])
        ax.plot(xd,yd,v.get('shortcode',d['shortcode']),alpha=v.get('alpha',d['alpha']))
        xt=v.get('x',d['x'])
        yt=xt/float(v['value'])*v.get('offset_fac',d['offset_fac'])
        ax.text(xt,yt,v['name'],rotation=v.get('rotation',rotation))
fig.savefig('time-vs-length.png',bbox_inches='tight')
