# Jupyter Notebook themes

## reference

[GitHub: jupyterthemes](https://github.com/dunovank/jupyter-themes)

<br>

## install package

in anaconda prompt ...

```bash
(base)> pip install jupyterthemes
(base)> pip install --upgrade jupyterthemes
```

<br>

## my themes configuration

- apply theme

  ```bash
  (base)> jt -t monokai -f roboto -fs 11 -nfs 115 -ofs 105
  ```

- apply jtplot.style

  ```python
  from jupyterthemes import jtplot
  
  jtplot.style(theme='onedork', context='paper', spines=True, ticks=True, grid=True, gridlines='dotted')
  ```

  

