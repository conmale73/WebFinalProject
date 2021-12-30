<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Dau Gia</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
    body {
      height: 100vh;
      background-image: url(data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAsJCQcJCQcJCQkJCwkJCQkJCQsJCwsMCwsLDA0QDBEODQ4MEhkSJRodJR0ZHxwpKRYlNzU2GioyPi0pMBk7IRP/2wBDAQcICAsJCxULCxUsHRkdLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCz/wAARCAC0ASUDASIAAhEBAxEB/8QAGwAAAwEBAQEBAAAAAAAAAAAAAAIDAQQFBgf/xAA9EAACAQMCAwUGBQMDAgcAAAABAhEAAyESMQRBURMiYXGBBTKRobHBFCNCUtFicuEVM/Ci8QY0Q4KDkrL/xAAZAQEBAQEBAQAAAAAAAAAAAAACAwEEAAX/xAAnEQACAgEEAgIBBQEAAAAAAAAAAQIRAwQSITETQQUUURUiMkJSYf/aAAwDAQACEQMRAD8A/MM8+eK3O9DZg1k90A8iT8a+2caCaqXdkQEnSC0DkJjapAT9qYah1HlSTa6BKjY2+kGtzWam6t8TW6mndqSCMM4xnEnlTA+A2rD+n+0b0CqgHmeQp+Q89qTkPWm5DzNVj2TZo2p13HmKQbUwnlVo9k2dRADAZPff12rA46H4j+KYgkoRkm5cEc9hUs9K6bIMuLgxAO45j+K3VMkzv1qSAyMc6YAmrxYGWtkalx86e2wLRnY/IUJaARbnaISWjQJ1AAbnEfOktzqnoG8tjXSnSINWMrIQ2otMd2IifGpMaJNITmjKXAlEoxt9jbjX2naXC22jRCwAN53mucmaqfcXzf7VMgyYz5VzyZVCbHypWMnNN1pDvXOy8RTWMZrTSGueXZRDu3DkJ2Vu4pC98vcDaj1EKKkfCihVZ2S2qszuwVVQEszEwAAM1GTKoTG5rMbitbBKwQQYM9auHsjhbttk/N/EW7itjKC2ylOu5BqbGQkCGbIiEG0kcz4VJmZ2ZmMsxLMepNMx1GT8qSoyY4hBAIJzilpvDrE9KDG3jNBjQh/mn4b/AMxY/vFbbWHR2QOqsCVadLRyMZqtvSLliFj81fmaKVM83RzOYdx/U31orbyxdujo7fWii20xLlGjKxNEDGROZHSDGaxJEYMGY6UdfOmjPZe1pJkrOwPKrXzZZibdoW0gaVDM3Lq2alZdV3QHM5JrtucRZa0os8Kloi01t2Vnc3CxMsdZIHTHSu3GlsOWbakeeST6UCmIPQ/Cs0t0MGoNclBicKOgGee1YKCIIHgtApmD8h606nbw1H5UnKtH8/SqxJyH+9Ou3qKQbD1+tMPuKquybLz3h/fc+lIKY+8P7rv0pBXRZNoopMjzFNJk+dTXceYrevnVEybRZWaRmmRswcT86ipMjzFaD3hVlMNDTvWVk70pJouRiRQwUAkDvNvPh0qZAj3h861iNKyDMk7xSFl6H40JMaQECNx86mTTFhyB9TSVCTKpAeXrUzTnakNRKIWiSCCCQRkEGCD4EUUpNRbKIw8/jQQJ9BWHnWnf0X6VNjFwN6WAc5jangYkwCGMxOQNopMkCpMaBsaQBAilz1rScjFHXwnnRGVUHSo9Kutq4xtEBm0srGFOFByZrnS7cUCDt613cNx/HWLd5LV+6gvp2dxVcjtEOdLeFWx7H2QnuTtHncQC1680GGdmEiDBJO1FPduMzkyfU5ooS22VjJ0CAabQ1AjvEb8z0qh4W42prSu+lS76VY6VG5YjlUbOpms21EsdQGw6nc4p2usoIV2AYRAJEg8jRi1XIWpbuBRiQfKhnIxyKxHrvUi086Y/p/tFZu/A9v5GLRpzyFAmiFAJjYLziZoBX9vzNJcho2DvTAGBt8aARC93keZ61roymGEGJg+OaqkAYDy+NNGRkbH+KRRjH+aYDEmZ8D500BlBiCGAwc+eOdaokgSslljPOYpAVjIkinRlDIdP6lOfMVZMnJHo8Zwx4S/d4Z47axe4i1dIIKkqYxzrmVO6zdogIjun3mnmMR86v7Qvi9x3H3gJ7TiOMcY/c+9cQY4EDJ6fzXQpr2R2sfPUfEUEEGPvSFj0X4CtY95tt+VamjaHWQQfvRqyfOkDcvjRM0rMofU3U/GjU3U/Gkmsk1m49tKEmB5mk1FGE7iDmCOtYSY9TSmi5GpGsxYk4znp8hS0SKUmai3Y0hicelTNMTiPD70yqhB7x1kgIgWdU+M0asS4JUhinYxjGCcj7VOoMsjDvWn7D6URQQceQNCQkHJTPNvkJpcdcmfTzrSIA8+dLmYjJJ8qmxIXpQcetUTZsDONgT6Uj7iptiT5odJIcgL+WAxJYAwSFAUHf0oJwM7sfPFTTamwPjWWzGhXZtVFEBs970XH1ooWNIFRjBGR3h/3rGViTg086dUbjV8yKVoOo8xS/wCHuxQj9PmKZsEeAANKwAMDImJ9JrRitTNKGYadxoFIPvTYjPUeexrdIyQZEcuVMHQ36U8j9aDkDyrFKkQRyI39aaVgYbbqP4qqZJjWrr2mDJEjaQD8jVMsvr/NSJQnaNsD/NPACzuJX6c6qn6C0bpPT61qg6l/uH1rCI5CDkGdxWr7y4HvDn400wtHTcy1wzzv9f3VF7rvo1sW0IttZMwiCAo8Byprjd+5OP8AdAz1aoTVGwUUyaZtz5mkU94ev0o1TJ8a8mZQ1aCIMkzIgRiOcmkmtx1pKRlGzRyB50tE716z1Dk931NKTFH6R5mkJos2jaw1k70Y+PhQbGkFE79YxH3qmix2bubxFwARbNpu9J/fMfKpAklQIkwMx18aDYkgJaWGAQDGAabiHtPeuPat6LZ0wp3HdAO2N5pSx1N4g/SlPmDid6DEBncA7AmB6VhmR5VezxAtWuNQiTxFlLIjZdN1Lsn4Vz6x+0fOg2IuWs2kB7ty6QCGIIS2d8KdzyyIrn1aizsZJeST7zE1mqf0jfxoLEzA2jahJ2KKF1MBgczSk5yZPypipzJIzBHOsEA461KRRCgkGIphumQSVDGes9KQ+9vzNFs99cc6nZtFCRJxz50UjHO//Joo2bRpfWT1I+9a8AHY1PS24IPlWSdvGfXaluPUbyHmftVi35dsQB3SZ5nJxUZwPWmGQ3hHzMUomNFD7wxHLNMBnEg+G1K2okk7zmDt51S2eGFm/qN38RqtiyFC9lpzq1zmelVQWKQs5IBnlMU0DGRsOtJvyzW5x5CqImxysRkZAI9aqAOybI99ev7aQ/o/tWrhHNokDdhGRyXxq8FZKTJERznbrjFCZZJ/cv1FOyPGw36joKEtsGSYGVIkjPeGKVcmJ8BeM3LhmSXumeveNSqlz328TdP/AFGp1knyalYynPx+lZMVttWZlVQWZpChQSxMbADNLWpmNDTTLv6E58qWCDBEGnUZ9G+hprkDM1novwFZrPML8BQRSmvNnkPrJEkLMmcDwrNf9KeqClJhR5n6ClnpU9w1E9K1+Hu+zfajXLfDLesPwJ4dlRUvMLjuriQZIiJrziT8hSmQSMSDHI/MUxxgjIEb7HxFFsSVCsdvSs5CgxigCQPDp1NE0Y7ny+1Ly6YE/Omcn34MEaQY7oIAkA1MwRk8vjRchJGasnEcoFA3HrWSAT0PPnTSp8Ik93flUmxmysIpVQVY6iCSzTyPKteFYBPdIXJicigBIvajDa7aooWZ3kk0kknUdwFG/TArGz1GBp1FsyT1+1KJDHyBrVwTymd/I0jVKQ0hGmSfE0DBB6EGsrQFMy0QCdiZIG2OtTKUYSCSaKGJJzkgAT4DAorBUbWUYptRPrWgMA6dM04wDkZK48jNKCRMc8HxoE0kYylw6rlxpmXbPXO9G/PPjS5G4renLbnNUizBwCKtGrTlBhRjGwioCSDHURTjEdcb1eLXsjJHs+xuBtcZ7U9l8PdNtrVy9bFxGaAyhS0HbeOtew3sy0eBPFs/sm2puEC1YuDUcb6WJPzr5MXHRlZWKsApBBIIxyIrot33KlZxDfau/DkjFnDmxzl0zo4hOG3GkGTsykcqgBZlTmVdYgrUS8CZiJgEbyQDWLmIwNSbz9ayeSLfRWEGlyDkycie9sepJqfqKwnJ8zWGa5myqVFELSCCQRJBEgjG80zdl3NDMe4uvUoWH5gQTgdfkKkpM+jfSgGvWa0WVQT74Hxr0+D4GxfS+78Zw1rsrTOFudpquGI0pCxPrXkA1ZHYcxlW57RIzXViyRXZz5IN9OhriIpIFxD0ifuKiRG5zvz5+dBM0rMxiSTGBPTapTkm+CkY12afdHmfoKQmK0tK7Rn7CkqLZQYAkEiMdTFGk9V+IrP0nzFYSKLlRqRuk9R8RVbTdk1t9XJ4IjBIK86iCapBAt+6ZDeW5ryds8xrl12sJZiES/euz43FQH6Vznl1jEczVruqSD1mBsKiw2oS7FAGDAlWBVlJVgwIII3BFAI8ZiKUmSDk9Sc5oP0NTsrRWdJuk9bZ+dTOZjwofSWYhpWFyccgNqUbUXI8kNBAGdwDHMeFTamkVkZ6edBuzSfOjE0wUnbPlM1VuG4hGdHs3FZFLOGVlKqBMtNHa6sV+jnb3j5misO5ooDOk2OjVnYv1FdUURVtpOzl7FoMjOIiKOzuD9NdUVkGd6SiZZB9YW2pVRp1HUq95tXe7x5xSZGDvjlXSRSFQa2jCVM2oaZxKhh5HY0xt+J+FaQ0xJ+9JGM1tRIxsqj5V08PYu3kuhFZiiPcIHJRAJrmlvkAfGKopcBjjI2+FXxSV8kZ2K4ICitSY/8AkX70h1EjA9PGmAZT6xjbHOt7fBlUhDuaw1UqdyN80umvNGirv6H6VlUVDJ8j9KUoRXtplmA4j/vTIcnyP0NJFPbEk+TfSvGhmKymiiK08O9kJY4e72tljea7+UjE3beggTcEQJ/Tk1CncdIgAH5UIoJgmAdyBMelCSPIQ7HzH3pM1TSdLHxH3pYPSgxIBXQ1t1Thng6bnalTy7rlTUURmnuztjAwBPOvR4jsv9N9iBXU3V/1HtVBlkBvgqWHiNqUTJHK9tiC+IAUZInbpUWSeoiujS+AZBgY8DmjsxpPeMzERuI61VxTAnRxlTiTtMetIR4/Wu3sQ2wkwdpJwJNTa0mIBGBMmc8yKg4MspogSVYHGw3B6VjFzGQR4DAruu27N1ka2mhEsWFc5J1KiqzHPM/WolAMCKm4sVogLTspZSsADVOCCTAGcn0rewYxLr86sAelaFP8ChtFZJLDDOr4GrG09xjJdmYQdTEkgVoVoODyqioxwSB5mKpFNqjG12c3YW+g9aK9uz7KF22lz8XwFuZGm9xA7SRuSoGPCiqfWkS86PLAOaYqvdjJjJnE+HOrpw7NvcAGf07kcqqvCDBLAmQcHERkZ51scTZ6WRHIFBHPVOOkdKOyNd6cKJguuOv+Kt+GEAEzExAg53kxV44LISzJHldi3T4UrWWUkFSCNwRmvWexZCCFbWGJLSdowoXapNZQsJJkgSQdRJPM53pPBRizHnC0SY2xjEyelDWjOR0nE17C8JYUtqDYOziGjlIq6cLw5IKhZJgENzIqkdNZKWpUTwU4d2JgEgZkDlNUFhgHkcvvXv2/Z9sMQVGDyJO/lTjggRcGhSQBGR1zvVlpURlrD57sQNOmGJUFsHBphwzEOwk6VBMfpkgSZr6BPZ5OkrbVpO2pB967bPsyzcVxoQsA0kMsKP3AzvS+skRnrkuT5D8NcJAA33rsT2VeIViGAYt3Sp1KAcSa+xseyeHRNZFptBPulSQOsTXbbTgs6rYZjsSyb9N6Sx4489nFl+UnVQR8rY/8Oh7N+5cuFWVW7NVsu+tuQkGvNu+xeKDsqoxACkHQwmeWR8a+/wDx/AWWdBbQQpU5EgDAyCax/a/CMVVbduBpjJBMZMg0n+7+nBxw1+ru9p+e/wCie0sheHcyJ907dRTWfYntJtQTh3MA/pPJeVfoD+2eDDE9gjBMr3iNifCp2fbNgXGhbABl5W6AqkiAJOal4vagdH6lqmv4nwT+xOPSJsXDBAYAHVvECakfZXHE4sXImBKnediYiv0T8fw9wW3UWz+lyJAkmJJMUH2jwaPoNu2UEAZYjI61viX+TF8nqEuYnwy+wPaLAHsLgBUMJXl4xULnsni7ZYtabSpAaQRBPWv08e1OEZNQ0CFHdJyeQivNvcbwF03XdAD/AOppDQOgIasjDdw40DH8pqZPmJ+f/wCnXdBOgzK8oHPY1L8DckSD1MicdMZr7k3PZV5g2uAXC6AsiRzxScVw/swKezvWwYByjnltIFP6+NnXH5Kd1KJ8O3DMJwR3hpEzvympdhcVmBVsGdsjzivrBw/BEQWRm1AxpcGFkncVzXuERRCISSSdjIk4+NGWlj6Z2w1t8UfPhfDnVDaKwCMx4c69H8NbGqbZDKGdpxCjHOnFixDBhBjHmfvQWGizzJ8nmk3YMSAxE6QBJGMxUzaaDivXXh+HLINIEkyQTEDER/mrPwlhZaCVBjwJ6V7w2Y9RVHhQNR1yZbvaYmPDlSsixK6Tk4zIjnXofh1Y3e60AMwCDCmefhSfh7Z5n/nnXO8R0LKcS28A90kzjpQUIG1elb4S2Z75ECRzk9Kp+ETRcLMS0KtsSkAzLFhvttFeWBnnnPKXswLmsMW09zTEAz+qeVKrpLBgDq0gOZlADmF2M+NdN3hgp3OdxGKgbQ8fHBxXPOLReLTMN18Z5AbKMDHSis7M9fkaKnukLYj0tCgmFgcpyYPWrKBAzn0rlbiDBUuCDpy2gtC7DBJitt3wQy63CkDVpV86cj3RX0E0jilbPRtIzKVBQgd47Fv5rdSLgnw/5Nef2qqSrWL+uQTqF0EAjAKsRjntTKymSbT9PeVT8pNWU0QcJWdjhAzqVGpSQwYqQCPGYrje6FOFtCGjJBPXAArCH7NmFp8ErqNyFypbOqNoJ8a5WuMAjAkESmoXViCNhAJGD151OeVFYQZ2rxV0KdICiCRPZka4GYaMbCqHieJXstNy2WdAT2QtEgyVghBy5edeWCj6Fm0hyHuXLvdxmQGIE8qRLiqRcFx+7DqU296MwBU/P6G8FnqNxV7LdqrICASUAIMdJNbYvq9xBdNspqzhtRETACAmvNN2ySQi3RmQB5SSNbfCrWm997dnibltG/3mJtrLe6HKqVznnVFm5BLAq6PdW/YK6YtiRslsjPWXM/KnF6wijQy9ocN3CQPHaJ9a8ccQobUFtBSWc27ep9AB2LNApzx6nUAlpSVAlhrYwd1gY/jFdSyo4HpueT1vxKyO0vt3lkdna1EtExpAnzrnu3+KUFjduWySDpuIQTJGYJH0rzzfvAmXaV/adIMgMCY5Vz3ijNqJJLFZ1sSMjctM/KseZGw00bO65evvcb8y/cdUgTsjKQBqL8htH/DNuJuOQA6wjfrNkMzHJkIDtmK8t3OtgGkQwhZ0sPL4VO2y2nDayJGQkawGkEd4RNczztOjvWnjXB9NbvFGCm3w7sAo1YugnfVJxPpW3bui25SzaS4Z1OXYEqxEQhMYz8fCvn7XEtaabbEQRpYEyY5ya7G4h3hmZ+8CQXJMqTMgnrV45k0cs9PUrO23xVzRcXuEMFE6oCmZyBNKOJdWugtqYkp3WLLoAiIYR5GuW26lbgDEt3mcEqEI8AB5/GhrpaG0ptBRVgYETA68/wDNLffIPEkdtziWVUCOIOSjkkjcSQgCgct652vBhpDDLliGfuCMQR4dZNQ7kTILgSVUZWDEE1O5cW4AOztJpULChoYjGoyd6LmxxxpHUeJZAghSVJjSxKDyAwfjStxnEOktoYL3F7xBXnAWa5ASxQKgVjgZaXJOAB15UHQxCC32enu+8xBM5Z/8VPeyyxxO+1xA1WjcZFD5ILEYmO9pn6Vl3iSzHVckmSGV2aPAxXmP23ugqyqpj3ipC53Gaw3idDrbKYlSrEklYBbSTOaLztcC8CfJ6NzitW124LYVUUMxmVBgEAnximt8UjBzcfiGcCVOpHUxjvTmuC3e0zIkRDEoCQpBmFfB8M0P29p2S7a0vpBE90r+oEcs0fKa8XFHpNxCpBZ4baCijxBBBiPWpXuJDaNLE/lrhleY8MkVwvxF9lVGuMUWdIYiFnpvS3PxWizcZluIR2dsrdUsgT9JQNI3xivSzGxw8lzfQnDKDMElXgddpPyoXiPFT/aSfkRXKb91o7QswRdIDwSo5QRmhRcdkFoF7rd0KCAwYkadInNR8hfxnoLfULq1wSxAkEDG+4jpVxdBCv3TM4328sV5Be8JD2yHLtqJRkcmcglInI5is7wzBySczOfOmsrA8SPRvMCT3fHE1zMDCkggMCVyYIBg1BrllbbalvrdGkKUYi2wklmbVORgADz5ZgLzaW03GjYgtlszuK5p5LZ0QjSOvA/d6H/FFcnbXP3N9ftRU7RQublyRCWbfuiDCicCTPzrGvuJVrwOnu/lwR3cbriufROwf1A+5qtmzYdwlziksrpuOWKPdI0KTBS3JzgVvkBsHa8XJZmuOYGXbJ5RmmF54OjkM94g56Vza+HE5Zj1IIHwo7RSDlRAx3WMnptSWRh8ZQmZJcSWJIVZPmWNKSw27uCAWIJgiDv/ABSB2aQHB/8AtA+ArVtalvPc4jh7QtqpC3Gc3LhJiLaKp23MkUHMaiTIUmWaTtgch4mnKgWkchtJLKpcmMZIEc+vnUi9se64PiQR8MUhcbhknxDMfnUt41EurhTpBG+SqyB4gDPzre3ugd5jpkNpZjpkf0j+KgkMWLFmGkhYJUKx2ORmOlUZeEspZYcUbt11Ju27dtlS0wYjSXbBkZwK3ezXBMt2r69AfUZA/KyknkCf4qqcS2l1guCRie6HWYJYDzx/FcBe2QcgDppMnljlTG7q1S7QSDpVQqTthQY+VOOVheNHpPxd5lFpryi3bEIltVAnUTgKPEnNTbiCyqA5JVQO9gKuZqFj8KLvDniHvLZBDX+ztobmmZhFYxnETFSd7WOzDRLAKx7wjYnGnNUeYksXJ0rxfE25NvKOGRgw7rg7gwZj1rnF1g2prmxmFAaPDOKkWJ3UnpLEj0FaokSVAEwMZPgM1JzbLKCR02bryWQHAYkmGMAQYBxXQ3EXnKG5dJ021tw0dxV2VY5Vy8RxN686MVtIBbtIEs2rdtAEQKIVREmMnrnnSI9yQAQJO5CgeZMVSORoEoWeit8AACWYkzuMQMYpk4u+ovhHUB7ZRl21rIxjPjXndpc6/IfxXTZ4viLCXgrR+ITsrmFJNmQxAkdQM+HjV1mbOd4kivb3ohrhUGBJPeIjTEjMUy3NIaAGLKVBct3ZI7ygGJ+NQUuSFMMAGYHQGJG8kgTFOLhEiFzjA9eVNTsLhRS5euXGUvcuPpRVDMTKhRAXyHKl1XixVQZgk6JMgZJxS6h+0ehIqlh+DD2zxFu69rXFxLThGKQZ0uQYPpWtmURa5xFu21xLjqWlCyswgMMjB51y9u0BGJ0jYjJEkHFWuhSSwDFSSZxjoIqL21GG1qYBgqJgiRXPNts6IqkMWgNDahMBgSI8YNMbrsCxYs097VmZ5ma5wI912H/tP2NXtkXAQ960gtW5BcMC4kLoUKpzmeW1TUmLajRoYMzAQjANDAE6p2Vs0kOAShBGAwBAJHiu9NfsmxduoL9i8iMQt2zrNtx+5Syg58QKnrLlu+shVEKpEhcchWOR6g75hlEwC0NBMKcnrRIkFlI5iCCM52olM6jqOIORHqBPzqtpOGu9pq4i3ZK22ZTdR2F1gMWwVBgnkSIo2KjbTiGk6oiFLMCc13Xb3APw9m3b4QrfGs3LhvXNTzsAvu4rzCgUFs6V0hjBYAkcz48qBeCiNZjxUkfOuiGfaqZKWJSdlWa7Y1BLl22txIYBiQyzMMB5bEVBnM5a3cwpJTGSJIhwNq17yuIdiVkwBIgnmAay5Z4cCybHFdqXtB7ivbNo23JMpkkGMZB51yzlbtF4xpC97ljzBH2NFJoO2pxHRT9jRUrHRrOz4BbPIczWafekaJMjW0EDptNYbj7A6R/T3R8q0Id37oOc5Y+QpngGhSCTMEfpx66qYHTnCY3bvMfIUpYL7oj+owT/ABSFXE6hHi2BnNY2eGa42k6ZgQJMTnwFRknrOTjJpiUAA94ic+6PInelZ22wB0XFSbGkdPFcDxXBNaXi1Fp7tm3fRNSO5tXFDKxCExI61BSP0qJ/c/Lx6UgBOS0ADc5z0WgtIgCF5DfPU0bEo/kctyBnq3XyrFicxAIJ8qQAttHiTsPM02pViMnqRgeQr1nqHOSWEKhJ0yIkTyG9YHAEKM/uPvUhLGCTv1pk2LkYXrsTyFLcZQ5lQFPvGGad/CaYOGOQJ8KjqY5Jk7Sd6rbQwLjKdJJCb95hyB6U4uwtUVCjBPjA6mtMEmNoESIrO0YxIXAjAisNyOQqlUTTHwNMiQQJGAcE7HlSj70G6ugE6p7wG28jc0huqCQQZ8CDWNiKqMgeNOTnwgAeVSW4ukkmC3dXy5/xTrLKzgEqsaiNhO01qlQXGy6MdJGdiFInE5jHWjV/NSWTK6tKkzJnTIGDA/5mmJBOobGJBzmrxmScCwAmGJXBPeDdJAiJzWgifQn5VI3CTqY58ycDA3pe2ntBAjQ38VVTDtoeTy9fGt0K0FAdu8GMyf6fD1rnDqP0z5k112eJsqV1WFIET3mBrYKMnTYZNpWjneywMxg88xUmXSSMY5jINfTXeO9g3OAt2U4ErxYJLXzfchh0KxFeFdNssQLMHkNU43wapkwxStMlizSl2jnmRK90r4k93zNMq2mRmZwLgdVVVUyykElifdxgR41qvpJ0oDIIIMGVO8TSkAExsYIJ/adjXK4nTZmkiSO+M+6TjHMb0lUfSrOLbSoYhXAKlgNjBzmsJB94Seowf4oNGonqiBmBMEbj1rCeoDKdmGD6xTlJBKHUN8b/AAqZLAkwMnIjB8IqbKIw6Ts0eDD7ikIuQJ93JBGR8qcqCCUmQTI8PCpSykwSD4VJuiiH1v8Auj0H8UUB1PvBSeZKyflRR3G0dNlV1cKsD88qHYgFhn9JO1S5miiugBS4Bb0BdymqTkz4TXO0nJJJzvRRQl0eRI1qAM6KdiwB8qKKgzoQrEn6AcgKrZto6sWnDgemhm+1FFA8RLFgJ25AbD0ooopI0KdvdtjkQW9SYoorQDWlDXFU5EmR5CadSWOT/jyooqkOwSLQMVN6KKqQiKw/LH95/wDyKmGjVhTIAyJjIMjxooqUuyyHfBQDYIvzE1g3FFFaYyiO8xJiYrqtmSByOD8KKKsgMg7MTvQm1z+0D/qFFFZ7AOijRcJyQhI8DrC0o3ooqkTCgJinTvEo2V0Mw8CBOKKKt6JomIBJgHBwds4phAVGgHTcIAbIgiYNFFFiEisIooqbNM2yOW1UUC4bgfOm2zA88eNFFTHE5SflMR4VlwCLb/qbWD46YziiioTLIS4ApSOdu2xnqygmiiipjP/Z);
      background-repeat: no-repeat;
      background-size: 100% 100%;
    }

  </style>
</head>
<body>
<div class="container-fluid h-100">
  <div class="row justify-content-center align-items-center h-100">
    <div class="col-sm-4">
      <c:if test="${hasError}">
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
          <strong>Login failed!</strong> ${errorMessage}
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
      </c:if>
      <form action=""method="post">
        <div class="form-group">
          <label class="sr-only" for="txtUsername">Username</label>
          <div class="input-group">
            <input type="text" class="form-control form-control-lg border-right-0" id="txtUsername" name="username" autofocus placeholder="Username">
            <div class="input-group-append">
              <div class="input-group-text">
                <i class="fa fa-user" aria-hidden="true"></i>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label class="sr-only" for="txtPassword">Password</label>
          <div class="input-group">
            <input type="password" class="form-control form-control-lg" name="password"  id="txtPassword" placeholder="Password" autofocus>
            <div class="input-group-append">
              <div class="input-group-text">
                <i class="fa fa-key" aria-hidden="true"></i>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group d-flex">
          <div>
            <a class="btn btn-lg btn-outline-danger " href="${pageContext.request.contextPath}/Guest/Home/Index" role="button">
              <i class="fa fa-home" aria-hidden="true"></i>
              Home
            </a>
          </div>
          <div class="flex-fill ml-1">
            <button type="submit" class="btn btn-lg btn-outline-primary btn-block" onclick="signIn()" id="login">
              <i class="fa fa-sign-in" aria-hidden="true"></i>
              Sign In

            </button>

          </div>
        </div>
      </form>
    </div>


  </div>

</div>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
  <c:if test = "${message_register.equals('Dang Ky')}">
    Swal.fire({
      'title': 'Good job!',
      'text': 'Register succesfully',
      'icon': 'success',
      timer: 3000
    })
  </c:if>
</script>
</body>
</html>